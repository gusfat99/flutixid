part of 'pages.dart';

class CheckoutOrderPage extends StatelessWidget {
  final Ticket ticket;
  const CheckoutOrderPage({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    void handleBack() {
      BlocProvider.of<OrderStepBloc>(context).add(GoToSeatOrder(ticket));
    }

    int price = 35000;
    int fee = 1000;

    return WillPopScope(
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: defaultMargin, vertical: 20.0),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, userState) {
              User user = (userState as UserLoaded).user;
              int total = (fee + price) * ticket.seat.length;

              ticket.copyWith(price: total);

              return ListView(
                children: [
                  SizedBox(
                    height: 56,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              handleBack();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              size: 24,
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            'Checkout\nMovie',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 90,
                        width: 70,
                        margin: const EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                          color: grey2Color,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: NetworkImage(
                                  '$baseUrlImage/w154${ticket.movieDetail.backdropPath ?? ticket.movieDetail.posterPath}'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      TitleMovie(
                        title: ticket.movieDetail.title,
                        genreAndLanguage: ticket.movieDetail.genresAndLanguage,
                        rate: ticket.movieDetail.voteAverage,
                        mainAxisAlignment: 'start',
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: const Divider(
                        color: grey2Color,
                        thickness: 1,
                      )),
                  Column(
                    children: [
                      itemDesctiption(
                          'ID Order', ticket.bookingCode, true, null),
                      const SizedBox(
                        height: 8.0,
                      ),
                      itemDesctiption(
                          'Cinema', ticket.theater.name, false, null),
                      const SizedBox(
                        height: 8.0,
                      ),
                      itemDesctiption('Date & Time',
                          ticket.dateTime.dateAndTime, true, null),
                      const SizedBox(
                        height: 8.0,
                      ),
                      itemDesctiption(
                          'Seat Number', ticket.seatsInString, true, null),
                      const SizedBox(
                        height: 8.0,
                      ),
                      itemDesctiption(
                          'Price',
                          '${Utilities.toCurrency(price, 0, 'IDR ')} X ${ticket.seat.length}',
                          true,
                          null),
                      const SizedBox(
                        height: 8.0,
                      ),
                      itemDesctiption(
                          'Admin',
                          '${Utilities.toCurrency(fee, 0, 'IDR ')} X ${ticket.seat.length}',
                          true,
                          null),
                      const SizedBox(
                        height: 8.0,
                      ),
                      itemDesctiption(
                          'Total',
                          Utilities.toCurrency(total, 0, 'IDR '),
                          true,
                          blackNumberFont.copyWith(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          child: const Divider(
                            color: grey2Color,
                            thickness: 1,
                          )),
                      itemDesctiption(
                          'Your Wallet',
                          Utilities.toCurrency(user.balance, 0, 'IDR '),
                          true,
                          blackNumberFont.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: user.balance >= total
                                  ? successColor
                                  : dangerColor)),
                    ],
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  Container(
                    height: 46,
                    margin: const EdgeInsets.symmetric(horizontal: 26),
                    child: ElevatedButton(
                      onPressed: () {
                        var copyTicket = ticket.copyWith(price: total);
                        if (user.balance >= total) {
                          FlutixTransaction transaction = FlutixTransaction(
                              userID: user.id,
                              title: ticket.movieDetail.title,
                              subtitle: ticket.theater.name,
                              time: DateTime.now(),
                              amount: -total);

                          Navigator.pushNamed(context, '/successfull',
                              arguments: {
                                'ticket': copyTicket,
                                'type_transaction': 'purcash',
                                'transaction': transaction,
                              });
                        } else {
                          Navigator.pushNamed(context, '/topup',
                              arguments: {'ticket': copyTicket});
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              user.balance >= total ? successColor : mainColor),
                      child: Text(
                        user.balance >= total
                            ? 'Checkout Now'
                            : 'Top Up My Wallet',
                        style: whiteTextFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        onWillPop: () {
          handleBack();
          return Future.value(false);
        });
  }

  Widget itemDesctiption(
      String label, var value, bool isNumeric, TextStyle? textValueStyle) {
    var textValue = blackTextFont;
    if (isNumeric) {
      textValue = blackNumberFont;
    }
    if (textValueStyle != null) {
      textValue = textValueStyle;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: greyTextFont.copyWith(fontSize: 16),
        ),
        const SizedBox(width: 8.0),
        SizedBox(
          width: 195.0,
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: textValue.copyWith(fontSize: 16),
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
        ),
      ],
    );
  }
}

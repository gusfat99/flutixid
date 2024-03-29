part of 'pages.dart';

class SuccessfullPage extends StatelessWidget {
  const SuccessfullPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map? arguments = ModalRoute.of(context)?.settings.arguments as Map;
    Ticket? ticket = arguments['ticket'];
    String typeTransaction = arguments['type_transaction'] ?? '';
    FlutixTransaction? transaction = arguments['transaction'];

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: FutureBuilder(
            future: typeTransaction == 'purcash'
                ? processingTicketOrder(context, transaction, ticket)
                : (typeTransaction == 'topup'
                    ? processingTopUp(context, transaction)
                    : null),
            builder: (_, snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Container(
                            width: 150,
                            height: 150,
                            margin: const EdgeInsets.only(bottom: 70.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/${typeTransaction == 'topup' ? 'top_up_done.png' : 'ticket_done.png'}'))),
                          ),
                          Text(
                              typeTransaction == 'topup'
                                  ? 'Emmm Yummy!'
                                  : 'Happy Watching!',
                              style: blackTextFont.copyWith(
                                  fontSize: 20.0, fontWeight: FontWeight.w600)),
                          const SizedBox(height: 16.0),
                          Text(
                              'You have successfully\n${typeTransaction == 'topup' ? 'top up the wallet!' : 'bought the ticket'}',
                              textAlign: TextAlign.center,
                              style: greyTextFont.copyWith(
                                  fontSize: 16.0, fontWeight: FontWeight.w400)),
                          const SizedBox(height: 70.0),
                          Container(
                            height: 45.0,
                            width: double.infinity,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 55.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (typeTransaction == 'topup') {
                                } else {
                                  context.read<PageBloc>().add(
                                      const GoMainPage(bottomNavBarIndex: 1));
                                  await Navigator.of(context)
                                      .pushNamedAndRemoveUntil(
                                          "/", (route) => false);
                                  // ignore: use_build_context_synchronously
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: mainColor,
                              ),
                              child: Text(
                                typeTransaction == 'topup'
                                    ? 'My Wallet'
                                    : 'My Tickets',
                                style: whiteTextFont.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Discover new movie?',
                                  style: greyTextFont.copyWith(
                                    fontSize: 14,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () async {
                                      if (ticket != null &&
                                          typeTransaction == 'topup') {
                                        await Navigator.pushNamed(
                                            context, '/ordering');
                                        context
                                            .read<OrderStepBloc>()
                                            .add(GoToCheckoutOrder(ticket));
                                      } else {
                                        await Navigator.pushNamed(context, '/');
                                      }
                                    },
                                    child: Text(
                                      ' Back',
                                      style: mainTextFont.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    )),
                              ]),
                        ])
                  : const Center(
                      child: SpinKitFadingCircle(color: mainColor, size: 50),
                    );
            },
          ),
        ),
      ),
    );
  }

  Future<void> processingTicketOrder(context, transaction, ticket) async {
    BlocProvider.of<UserBloc>(context).add(UserPurcash(transaction.amount));
    BlocProvider.of<TicketBloc>(context)
        .add(BuyTicket(ticket, transaction.userID));
    await TransactionService.saveTransaction(transaction);
  }

  Future<void> processingTopUp(context, transaction) async {
    BlocProvider.of<UserBloc>(context).add(UserTopup(transaction.amount));
    await TransactionService.saveTransaction(transaction);
  }
}

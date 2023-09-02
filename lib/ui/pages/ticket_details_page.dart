part of "pages.dart";

class TicketDetailsPage extends StatelessWidget {
  const TicketDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    Ticket ticket = arguments['ticket'];

    return Scaffold(
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(children: [
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 56,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 24,
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Ticket Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                height: 170,
                decoration: BoxDecoration(
                    color: grey2Color,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '$baseUrlImage/w500/${ticket.movieDetail.backdropPath}'))),
              ),
              ClipPath(
                clipper: TicketTopClipper(),
                child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 16,
                      // bottom: 20,
                    ),
                    width: double.infinity,
                    color: whiteColor,
                    // color: Colors.red,
                    child: Column(children: [
                      TitleMovie(
                        title: ticket.movieDetail.title,
                        genreAndLanguage: ticket.movieDetail.genresAndLanguage,
                        rate: ticket.movieDetail.voteAverage,
                        mainAxisAlignment: 'start',
                      ),
                      const SizedBox(height: 16.0),
                      ItemDescription(
                        label: "Cinema",
                        value: ticket.theater.name,
                      ),
                      const SizedBox(height: 10.0),
                      ItemDescription(
                          label: "Date & Time",
                          value: ticket.dateTime.dateAndTime,
                          isNumeric: true),
                      const SizedBox(height: 10.0),
                      ItemDescription(
                          label: "Seat Number",
                          value: ticket.seatsInString,
                          isNumeric: true),
                      const SizedBox(height: 10.0),
                      ItemDescription(
                          label: "ID Order",
                          value: ticket.bookingCode,
                          isNumeric: true),
                      const SizedBox(height: 20.0),
                      generateDashedDivider(MediaQuery.of(context).size.width -
                          2 * defaultMargin -
                          32),
                    ])),
              ),
              ClipPath(
                clipper: TicketBotClipper(),
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 20,
                    bottom: 16,
                    // bottom: 20,
                  ),
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      // color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      )),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              (2 * defaultMargin) -
                              32 -
                              105,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name",
                                style: greyTextFont.copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                child: Text(
                                  ticket.name,
                                  textAlign: TextAlign.left,
                                  style: blackTextFont.copyWith(fontSize: 16),
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "Paid",
                                style: greyTextFont.copyWith(fontSize: 16),
                              ),
                              Text(
                                Utilities.toCurrency(ticket.price, 0, 'IDR '),
                                style: blackNumberFont.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        QrImageView(
                          version: QrVersions.auto,
                          size: 100,
                          padding: EdgeInsets.zero,
                          data: ticket.bookingCode,
                        )
                      ]),
                ),
              ),
            ])));
  }
}

class TicketTopClipper extends CustomClipper<Path> {
  double radius = 15;

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(radius, size.height - radius, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(size.width - radius, size.height - radius,
        size.width, size.height - radius);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TicketBotClipper extends CustomClipper<Path> {
  double radius = 15;

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, radius);
    path.quadraticBezierTo(size.width - radius, radius, size.width - radius, 0);
    path.lineTo(radius, 0);
    path.quadraticBezierTo(radius, radius, 0, radius);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

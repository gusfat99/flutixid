part of 'pages.dart';

class TicketsPage extends StatefulWidget {
  final bool isExpiredTicket;

  const TicketsPage({super.key, this.isExpiredTicket = false});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  late bool isExpiredTickets;

  @override
  void initState() {
    super.initState();

    isExpiredTickets = widget.isExpiredTicket;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Note : Content ListView
          BlocBuilder<TicketBloc, TicketState>(
            builder: (_, ticketState) {
              return Container(
                  margin: const EdgeInsets.only(
                      left: defaultMargin, right: defaultMargin, bottom: 70),
                  child: TicketViewer(
                      tickets: isExpiredTickets
                          ? ticketState.tickets
                              .where((ticket) =>
                                  ticket.dateTime.isBefore(DateTime.now()))
                              .toList()
                          : ticketState.tickets
                              .where((ticket) =>
                                  !ticket.dateTime.isBefore(DateTime.now()))
                              .toList()));
            },
          ),
          Container(height: 113),
          SafeArea(
            child: ClipPath(
              clipper: HeaderClipper(),
              child: Container(
                height: 113,
                color: accentColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        left: 24,
                        bottom: 32,
                      ),
                      child: Text(
                        'My Ticket',
                        style: whiteTextFont.copyWith(fontSize: 20),
                      ),
                    ),
                    Row(children: [
                      Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpiredTickets = !isExpiredTickets;
                                });
                              },
                              child: Text(
                                "Newest",
                                style: whiteTextFont.copyWith(
                                    fontSize: 16,
                                    color: !isExpiredTickets
                                        ? Colors.white
                                        : Color(0xFF6F678E)),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 4,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: !isExpiredTickets
                                ? yellowColor
                                : Colors.transparent,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpiredTickets = !isExpiredTickets;
                                });
                              },
                              child: Text(
                                "Oldest",
                                style: whiteTextFont.copyWith(
                                    fontSize: 16,
                                    color: isExpiredTickets
                                        ? Colors.white
                                        : Color(0xFF6F678E)),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 4,
                            width: MediaQuery.of(context).size.width * 0.5,
                            color: isExpiredTickets
                                ? yellowColor
                                : Colors.transparent,
                          )
                        ],
                      ),
                    ])
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double radius = 20;

    path.lineTo(0, size.height - radius);
    path.quadraticBezierTo(0, size.height, radius, size.height);
    path.lineTo(size.width - radius, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - radius);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TicketViewer extends StatelessWidget {
  final List<Ticket> tickets;

  const TicketViewer({super.key, required this.tickets});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (_, index) {
          return TicketItem(
            onTap: () {
              Navigator.pushNamed(context, "/ticket-details",
                  arguments: {'ticket': tickets[index]});
            },
            ticket: tickets[index],
            margin: const EdgeInsets.only(
              top: 20,
            ),
          );
        });
  }
}

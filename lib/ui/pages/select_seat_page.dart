part of 'pages.dart';

class SelectSeatPage extends StatefulWidget {
  final Ticket ticket;
  const SelectSeatPage({super.key, required this.ticket});

  @override
  State<SelectSeatPage> createState() => _SelectSeatPageState();
}

class _SelectSeatPageState extends State<SelectSeatPage> {
  late List<String> selectedSeats = [];

  void handleBack() {
    BlocProvider.of<OrderStepBloc>(context).add(GoToScheduleOrder());
  }

  void handleChangeSeat(seat) {
    int hasSelected = selectedSeats.indexOf(seat);
    setState(() {
      if (hasSelected > -1) {
        selectedSeats.remove(seat);
      } else {
        selectedSeats.add(seat);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    selectedSeats = widget.ticket.seat;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          handleBack();

          return Future.value(false);
        },
        child: SafeArea(
          child: ListView(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(
                      defaultMargin, 20.0, defaultMargin, 30.0),
                  child: headerNavigation()),
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 277,
                height: 84,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/screen.png"))),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                child: Column(
                  children: [
                    generateSeats(),
                    const SizedBox(
                      height: 23,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        seatsAvailableIndikator('Available'),
                        seatsAvailableIndikator('Booked'),
                        seatsAvailableIndikator('Selected'),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SubmitButton(
                isDisabled: selectedSeats.isEmpty,
                onPressed: () {
                  context.read<OrderStepBloc>().add(GoToCheckoutOrder(
                      widget.ticket.copyWith(seat: selectedSeats)));
                },
              )
            ],
          ),
        ));
  }

  Widget headerNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            handleBack();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width -
                    (2 * defaultMargin) -
                    (16 * 3) -
                    79,
                child: Text(
                  widget.ticket.movieDetail.title,
                  style: blackTextFont.copyWith(
                      fontSize: 20, fontWeight: FontWeight.w600),
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  textAlign: TextAlign.end,
                )),
            const SizedBox(
              width: 16.0,
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: grey2Color,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                    image: NetworkImage(
                        '$baseUrlImage/w154${widget.ticket.movieDetail.backdropPath ?? widget.ticket.movieDetail.posterPath}'),
                    fit: BoxFit.cover),
              ),
            ),
            // note: CINEMA SCREEN
          ],
        ),
      ],
    );
  }

  Widget generateSeats() {
    List<Widget> widgets = [];
    List<int> numberofSeats = [3, 5, 5, 5, 5];

    for (int i = 0; i < numberofSeats.length; i++) {
      widgets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              numberofSeats[i],
              (j) => (SelectableBox(
                    height: 40.0,
                    width: 40.0,
                    margin: EdgeInsets.only(
                        right: j + 1 == numberofSeats[i] ? 0 : 16),
                    onTap: () {
                      handleChangeSeat(
                          "${String.fromCharCode(i + 65)}${j + 1}");
                    },
                    isSelected: selectedSeats
                        .contains("${String.fromCharCode(i + 65)}${j + 1}"),
                    label: "${String.fromCharCode(i + 65)}${j + 1}",
                    isNumeric: true,
                  ))),
        ),
      );
      widgets.add(const SizedBox(
        height: 16.0,
      ));
    }

    return Column(
      children: widgets,
    );
  }

  Widget seatsAvailableIndikator(String indikatorLabel) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                  color: indikatorLabel.toLowerCase() == 'available'
                      ? greyColor
                      : (indikatorLabel.toLowerCase() == 'booked'
                          ? greyColor
                          : yellowColor)),
              color: indikatorLabel.toLowerCase() == 'available'
                  ? Colors.white
                  : (indikatorLabel.toLowerCase() == 'booked'
                      ? greyColor
                      : yellowColor)),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          indikatorLabel,
          style: greyTextFont.copyWith(fontSize: 10.0),
        )
      ],
    );
  }
}

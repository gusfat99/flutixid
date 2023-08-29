part of 'pages.dart';

class SelectSchedulePage extends StatefulWidget {
  const SelectSchedulePage({super.key});

  @override
  State<SelectSchedulePage> createState() => _SelectSchedulePageState();
}

class _SelectSchedulePageState extends State<SelectSchedulePage> {
  late List<DateTime> dates;
  late DateTime selectedDate;
  int? selectedTime;
  Theater? selectedTheater;
  bool isValid = false;

  @override
  void initState() {
    dates =
        List.generate(7, (index) => DateTime.now().add(Duration(days: index)));
    selectedDate = dates[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    MovieDetail movieDetail = arguments['movieDetail'];

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {

        return SafeArea(
            child: ListView(
          children: [
            const SizedBox(
              height: 36.0,
            ),
            Row(
              children: [
                Container(
                  margin:
                      const EdgeInsets.only(left: defaultMargin, bottom: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, size: 24),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: defaultMargin, bottom: 16.0),
              child: titleSection('Choose Date'),
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return SelectableBox(
                      onTap: () {
                        setState(() {
                          selectedDate = dates[index];
                          if (dates[index].day != DateTime.now().day) {
                            selectedTime = null;
                          }
                        });
                      },
                      height: 90,
                      width: 70,
                      isSelected: dates[index].day == selectedDate.day,
                      label:
                          '${dates[index].shortDayName}\n${dates[index].day.toString()}',
                      margin: EdgeInsets.only(
                          right: index == 6 ? 0 : 16,
                          left: index == 0 ? defaultMargin : 0));
                },
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            generateDateTimeSchedule(),
            const SizedBox(
              height: 30.0,
            ),
            SubmitButton(
              isDisabled: !isValid,
              onPressed: () {
                if (isValid) {
                  context.read<OrderStepBloc>().add(GoToSeatOrder(Ticket(
                      movieDetail,
                      selectedTheater!,
                      randomAlphaNumeric(12).toUpperCase(),
                      [],
                      DateTime(selectedDate.year, selectedDate.month,
                          selectedDate.day, selectedTime!),
                      (userState as UserLoaded).user.name,
                      0)));
                  // BlocProvider.of<OrderStepBloc>(context).add(GoToSeatOrder());
                }
              },
            ),
            const SizedBox(
              height: 40.0,
            ),
          ],
        ));
      },
    );
  }

  Widget titleSection(title) {
    return Text(
      title,
      style: blackTextFont.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }

  Widget generateDateTimeSchedule() {
    List<int> schedules = List.generate(9, (index) => 10 + index * 2);
    List<Widget> widgets = [];

    for (var theater in dummyTheaters) {
      widgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: defaultMargin),
              child: titleSection(theater.name),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: schedules.length,
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = false;
                  if (selectedTime != null && selectedTheater != null) {
                    if (selectedTime == schedules[index] &&
                        theater == selectedTheater) {
                      isSelected = true;
                    }
                  }
                  return SelectableBox(
                      onTap: () {
                        setState(() {
                          selectedTheater = theater;
                          selectedTime = schedules[index];
                          isValid = true;
                        });
                      },
                      height: 50,
                      width: 90,
                      isNumeric: true,
                      isSelected: isSelected,
                      isDisabled: schedules[index] < DateTime.now().hour ||
                          selectedDate.day != DateTime.now().day,
                      margin: EdgeInsets.only(
                          left: index == 0 ? defaultMargin : 0,
                          right: index == schedules.length - 1
                              ? 0
                              : defaultMargin),
                      label: '${schedules[index]}:00');
                },
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widgets,
    );
  }
}

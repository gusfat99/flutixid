part of 'pages.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  TextEditingController amountController = TextEditingController(text: 'IDR 0');
  int selectedAmount = 0;

  @override
  Widget build(BuildContext context) {
    context.read<ThemeBloc>().add(ChangeTheme(
            themeData: ThemeData(fontFamily: GoogleFonts.raleway().fontFamily)
                .copyWith(
                    colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: yellowColor,
        ))));

    Map? arguments = ModalRoute.of(context)?.settings?.arguments as Map;
    Ticket? ticket = arguments['ticket'];

    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, userState) {
          return SafeArea(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
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
                            if (ticket == null) {
                              Navigator.pop(context);
                            } else {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/ordering", (route) => false);
                            }
                            // handleBack();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 24,
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Top Up',
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
                  height: 30.0,
                ),
                Input(
                  label: 'Amount',
                  style: blackNumberFont,
                  controller: amountController,
                  onChanged: (val) {
                    String temp = '';

                    for (int i = 0; i < val.length; i++) {
                      temp += val.toString().isDigit(i) ? val[i] : '';
                    }

                    setState(() {
                      selectedAmount = int.tryParse(temp) ?? 0;
                    });

                    amountController.text =
                        Utilities.toCurrency(selectedAmount, 0, 'IDR ');
                    amountController.selection = TextSelection.fromPosition(
                        TextPosition(offset: amountController.text.length));
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Choose by Template',
                  style: blackTextFont.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 14.0,
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 14,
                  children: generateTopupNominal(),
                ),
                const SizedBox(
                  height: 102.0,
                ),
                selectedAmount >= 20000
                    ? Container(
                        height: 45,
                        margin: const EdgeInsets.symmetric(horizontal: 31.0),
                        child: ElevatedButton(
                            onPressed: () {
                              FlutixTransaction flutixTransaction =
                                  FlutixTransaction(
                                      userID: (userState as UserLoaded).user.id,
                                      title: "Top Up Wallet",
                                      amount: selectedAmount +
                                          (userState).user.balance,
                                      subtitle:
                                          "${DateTime.now().dayName}, ${DateTime.now().day} ${DateTime.now().monthName} ${DateTime.now().year}",
                                      time: DateTime.now());

                              Navigator.pushNamed(context, '/successfull',
                                  arguments: {
                                    'ticket': ticket,
                                    'transaction': flutixTransaction,
                                    'type_transaction': 'topup'
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: successColor),
                            child: Text(
                              'Top Up Now',
                              style: whiteTextFont.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            )),
                      )
                    : const SizedBox()
              ],
            ),
          ));
        },
      ),
    );
  }

  List<Widget> generateTopupNominal() {
    List<int> nominals = [
      50000,
      100000,
      150000,
      200000,
      250000,
      500000,
      750000,
      1000000,
      2500000,
    ];

    double width =
        (MediaQuery.of(context).size.width - (2 * defaultMargin) - (20 * 2)) /
            3;

    List<Widget> widgets = [];
    for (var nominal in nominals) {
      widgets.add(SelectableBox(
        onTap: () {
          setState(() {
            selectedAmount = nominal;
          });

          amountController.text = Utilities.toCurrency(nominal, 0, 'IDR ');
          amountController.selection = TextSelection.fromPosition(
              TextPosition(offset: amountController.text.length));
        },
        height: 60,
        width: width,
        isSelected: selectedAmount == nominal,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'IDR',
            style: selectedAmount == nominal
                ? blackTextFont.copyWith(fontSize: 16.0)
                : greyTextFont.copyWith(fontSize: 16.0),
          ),
          Text(
            Utilities.toCurrency(nominal, 0, ''),
            style: blackNumberFont.copyWith(fontSize: 16.0),
          )
        ]),
      ));
    }

    return widgets;
  }
}

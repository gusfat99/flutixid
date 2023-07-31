part of 'pages.dart';

class AccountConfirmPage extends StatefulWidget {
  final RegistrationData? registrationData;
  const AccountConfirmPage({super.key, this.registrationData});

  @override
  State<AccountConfirmPage> createState() => _AccountConfirmPageState();
}

class _AccountConfirmPageState extends State<AccountConfirmPage> {
  bool isLoading = false;
  void handleBack() {
    context
        .read<PageBloc>()
        .add(GoToPreferencePage(registrationData: widget.registrationData));
  }

  @override
  void setState(VoidCallback fn) {
    if (!mounted) return;
    super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: SafeArea(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            'Confirm\nNew Account',
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
                  SizedBox(
                    child: Column(
                      children: [
                        Avatar(
                          height: 150,
                          width: 150,
                          imageFile: widget.registrationData?.profileImage,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Text(
                          'Welcome',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 2.5,
                        ),
                        Text(
                          widget.registrationData?.name ?? 'Guest',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 2.5,
                        ),
                        Text(
                          widget.registrationData?.email ?? '',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 45.0,
                    padding: EdgeInsets.zero,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: ElevatedButton(
                        onPressed: () async {
                          if (!isLoading) {

                            setState(() {
                              isLoading = true;
                            });

                            SignInSignUpResult result =
                                await AuthServices.signUp(
                              widget.registrationData!.email,
                              widget.registrationData!.password,
                              widget.registrationData!.name,
                              widget.registrationData!.selectedGenres,
                              widget.registrationData!.selectedLang,
                            );

                            if (!context.mounted) return;

                            if (!result.success) {
                              FlushBarShow(context, 1700, result.message);
                            }
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isLoading ? grey2Color : successColor),
                        child: isLoading
                            ? Container(
                                height: 24,
                                width: 24,
                                child: SpinKitCircle(
                                  size: 24,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                'Create My Account',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                  )
                ],
              )),
        ),
        onWillPop: () {
          context.read<PageBloc>().add(
              GoToPreferencePage(registrationData: widget.registrationData));
          return Future.value(false);
        });
  }
}

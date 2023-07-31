part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ThemeBloc>().add(ChangeTheme(
        themeData: ThemeData(fontFamily: GoogleFonts.raleway().fontFamily)));

    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 55.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 130.0,
                height: 136.0,
              ),
              const SizedBox(
                height: 70.0,
              ),
              Text(
                'New Experience',
                style: blackTextFont.copyWith(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'Watch a new movie much\neasier than any before',
                textAlign: TextAlign.center,
                style: greyTextFont.copyWith(
                    fontSize: 14.0, fontWeight: FontWeight.w300),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 70.0, bottom: 20.0),
                  width: double.infinity,
                  height: 46.0,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<PageBloc>().add(GoToAccountConfirmPage(
                          registrationData: RegistrationData()));
                    },
                    child: Text(
                      'Get Started',
                      style: whiteTextFont.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    textAlign: TextAlign.center,
                    style: greyTextFont.copyWith(
                        fontSize: 14.0, fontWeight: FontWeight.w400),
                  ),
                  Container(
                      padding: EdgeInsets.zero,
                      child: GestureDetector(
                        onTap: () {
                          context.read<PageBloc>().add(GoToLoginPage(null));
                        },
                        child: Text(
                          "Sign In",
                          style: mainTextFont,
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

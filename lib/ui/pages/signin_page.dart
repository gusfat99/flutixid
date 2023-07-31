part of 'pages.dart';

class SigninPage extends StatefulWidget {
  final String? email;
  const SigninPage({super.key, this.email});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool isVisible = false;
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isLoading = false;

  @override
  void initState() {
    emailController.text = widget.email ?? ""; //default text
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (!mounted) return;
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    context.read<ThemeBloc>().add(ChangeTheme(
          themeData: ThemeData(
            fontFamily: GoogleFonts.raleway().fontFamily,
          ).copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: yellowColor,
            ),
          ),
        ));

    return Scaffold(
      backgroundColor: whiteColor,
      body: WillPopScope(
        onWillPop: () {
          context.read<PageBloc>().add(GoToSplashPage());
          return Future.value(false);
        },
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    Image.asset(
                      'assets/logo.png',
                      width: 66.91,
                      height: 70,
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Text(
                      'Welcome Back,\nExplorer!',
                      style: blackTextFont.copyWith(
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0, bottom: 40),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 16.0),
                            child: Theme(
                              data: Theme.of(context)
                                  .copyWith(primaryColor: yellowColor),
                              child: Input(
                                focusedColor: yellowColor,
                                label: 'Email Address',
                                controller: emailController,
                                helperText: emailController.text.isNotEmpty
                                    ? (isEmailValid
                                        ? null
                                        : 'Please enter email valid!')
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    isEmailValid =
                                        EmailValidator.validate(value);
                                  });
                                },
                              ),
                            ),
                          ),
                          Input(
                            focusedColor: yellowColor,
                            label: 'Password',
                            helperText: passwordController.text.isNotEmpty
                                ? (isPasswordValid
                                    ? null
                                    : 'Password to short!')
                                : null,
                            obscureText: !isVisible,
                            controller: passwordController,
                            isPasswordType: true,
                            onTapVisibility: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                isPasswordValid = value.length >= 6;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 50.0,
                        padding: EdgeInsets.zero,
                        child: isLoading
                            ? SpinKitCircle(
                                color: mainColor,
                              )
                            : FloatingActionButton(
                                onPressed: () async {
                                  if (!context.mounted) return;
                                  if (isEmailValid && isPasswordValid) {
                                    setState(() {
                                      isLoading = true;
                                    });

                                    SignInSignUpResult result =
                                        await AuthServices.signIn(
                                            emailController.text,
                                            passwordController.text);
                                    if (result.success) {
                                    } else {
                                      var flush = Flushbar(
                                        duration: const Duration(seconds: 4),
                                        backgroundColor: dangerColor,
                                        messageText: Text(
                                          result.message,
                                          textAlign: TextAlign.center,
                                          style: whiteTextFont.copyWith(
                                              fontSize: 12.0),
                                        ),
                                        flushbarPosition: FlushbarPosition.TOP,
                                      );

                                      flush.show(context);
                                    }
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                },
                                elevation: 0,
                                backgroundColor: isEmailValid && isPasswordValid
                                    ? mainColor
                                    : greyColor,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: isEmailValid && isPasswordValid
                                      ? whiteColor
                                      : grey2Color,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start fresh now? ',
                          style: greyTextFont.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.read<PageBloc>().add(GoToRegistration(
                                registrationData: RegistrationData()));
                          },
                          child: Text(
                            'Sign Up',
                            style: mainTextFont.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

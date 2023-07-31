part of 'pages.dart';

class SignupPage extends StatefulWidget {
  final RegistrationData? registrationData;

  const SignupPage({super.key, this.registrationData});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController fullNameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController confirmPasswordController =
      TextEditingController(text: '');

  bool isVisiblePassword = true;
  bool isVisibleConfirmPassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    fullNameController.text = widget.registrationData!.name;
    emailController.text = widget.registrationData!.email;
  }

  @override
  Widget build(BuildContext context) {
    context.read<ThemeBloc>().add(ChangeTheme(
            themeData: ThemeData(fontFamily: GoogleFonts.raleway().fontFamily)
                .copyWith(
                    colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: yellowColor,
        ))));

    return WillPopScope(
      onWillPop: () async {
        context.read<PageBloc>().add(GoToSplashPage());
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 56,
                          margin: const EdgeInsets.only(
                            bottom: 22.0,
                            top: 20.0,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: GestureDetector(
                                  onTap: () {
                                    context
                                        .read<PageBloc>()
                                        .add(GoToLoginPage(null));
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 24,
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text('Create New\nYour Account',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        height: 1.5),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          ),
                        ),
                        InputFotoFile(
                          onChanged: () async {
                            if (widget.registrationData?.profileImage == null) {
                              widget.registrationData?.profileImage =
                                  (await getImage()) as File?;
                            } else {
                              widget.registrationData?.profileImage = null;
                            }
                            setState(() {});
                          },
                          imageTemporary: widget.registrationData!.profileImage,
                          margin: const EdgeInsets.only(bottom: 16.0),
                        ),
                        Input(
                          label: 'Full Name',
                          hint: 'Full Name',
                          controller: fullNameController,
                          validator: (val) {
                            if (!val!.isValidName) {
                              return 'Enter valid name';
                            }
                            if (!val.isNotEmpty) {
                              return 'Please enter your full name!';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Input(
                          label: 'Email Address',
                          hint: 'Email Address',
                          controller: emailController,
                          validator: (val) {
                            if (!val!.isValidEmail) {
                              return 'Enter valid name';
                            }
                            if (!val.isNotEmpty) {
                              return 'Please enter your email!';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Input(
                          label: 'Password',
                          hint: 'Password',
                          obscureText: isVisiblePassword,
                          isPasswordType: true,
                          controller: passwordController,
                          onTapVisibility: () {
                            setState(() {
                              isVisiblePassword = !isVisiblePassword;
                            });
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Enter password';
                            }
                            if (val.length < 6) {
                              return 'The password to short';
                            }
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              return 'The password doesn\'t match!';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Input(
                          label: 'Confirm Password',
                          hint: 'Confirm Password',
                          obscureText: isVisibleConfirmPassword,
                          isPasswordType: true,
                          controller: confirmPasswordController,
                          onTapVisibility: () {
                            setState(() {
                              isVisibleConfirmPassword =
                                  !isVisibleConfirmPassword;
                            });
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Enter password';
                            }

                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              return 'The password doesn\'t match!';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          child: FloatingActionButton(
                            elevation: 0,
                            backgroundColor: mainColor,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                widget.registrationData?.email =
                                    emailController.text;
                                widget.registrationData?.password =
                                    passwordController.text;
                                widget.registrationData?.name =
                                    fullNameController.text;

                                context.read<PageBloc>().add(GoToPreferencePage(
                                    registrationData: widget.registrationData));
                              }
                            },
                            child: const Icon(
                              Icons.arrow_forward,
                              size: 24,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

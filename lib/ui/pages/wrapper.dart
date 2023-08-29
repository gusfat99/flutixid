part of 'pages.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    auth.User? firebaseUser = Provider.of<auth.User?>(context);
    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.read<PageBloc>().add(prevPageEvent!);
      }
    } else {
      if (!(prevPageEvent is GoMainPage)) {
        prevPageEvent = GoMainPage();

        context.read<UserBloc>().add(LoadUser(id: firebaseUser.uid));
        context.read<PageBloc>().add(prevPageEvent!);
      }
    }

    return BlocBuilder<PageBloc, PageState>(builder: (context, pageState) {
      if (pageState is onMainPage) {
        return const MainPage();
      } else if (pageState is onLoginPage) {
        return SigninPage(
          email: pageState.email,
        );
      } else if (pageState is onRegisterPage) {
        return SignupPage(registrationData: pageState.registrationData);
      } else if (pageState is onPreferencePage) {
        return PreferencePage(registrationData: pageState.registrationData);
      } else if (pageState is onAccountConfirmPage) {
        return AccountConfirmPage(registrationData: pageState.registrationData);
      } else {
        return const SplashPage();
      }
    });
  }
}

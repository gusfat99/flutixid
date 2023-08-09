part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class onInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class onLoginPage extends PageState {
  final String? email;
  const onLoginPage(this.email);

  @override
  List<Object> get props => [];
}

class onSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class onMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class onRegisterPage extends PageState {
  final RegistrationData? registrationData;

  const onRegisterPage({this.registrationData});
  @override
  List<Object> get props => [];
}

class onPreferencePage extends PageState {
  final RegistrationData? registrationData;

  const onPreferencePage({this.registrationData});

  @override
  List<Object> get props => [];
}

class onAccountConfirmPage extends PageState {
  final RegistrationData? registrationData;

  const onAccountConfirmPage({this.registrationData});

  @override
  List<Object> get props => [];
}


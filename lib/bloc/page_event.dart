part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  final String? email;
  const GoToLoginPage(this.email);

  @override
  List<Object> get props => [];
}

class GoMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistration extends PageEvent {
  final RegistrationData? registrationData;

  const GoToRegistration({this.registrationData});

  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData? registrationData;

  const GoToPreferencePage({this.registrationData});

  @override
  List<Object> get props => [];
}

class GoToAccountConfirmPage extends PageEvent {
  final RegistrationData? registrationData;

  const GoToAccountConfirmPage({this.registrationData});

  @override
  List<Object> get props => [];
}

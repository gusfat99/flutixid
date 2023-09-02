import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(onInitialPage()) {
    on<PageEvent>((event, emit) {
      if (event is GoToSplashPage) {
        emit(onSplashPage());
      } else if (event is GoToLoginPage) {
        emit(onLoginPage(event.email));
      } else if (event is GoMainPage) {
        print("event.bottomNavBarIndex");
        print(event.bottomNavBarIndex);
        emit(onMainPage(bottomNavBarIndex: event.bottomNavBarIndex));
      } else if (event is GoToRegistration) {
        emit(onRegisterPage(registrationData: event.registrationData));
      } else if (event is GoToPreferencePage) {
        emit(onPreferencePage(registrationData: event.registrationData));
      } else if (event is GoToAccountConfirmPage) {
        emit(onAccountConfirmPage(registrationData: event.registrationData));
      }
    });
  }
  // PageBloc() : super(onInitialPage());
  //
  // @override
  // Stream<PageState> mapEventToState(PageEvent event) async* {
  //   if(event is GoToSplashPage) {
  //     yield onSplashPage();
  //   } else if(event is GoToLoginPage) {
  //     yield onLoginPage();
  //   } else if(event is GoMainPage) {
  //     yield onMainPage();
  //   }
  // }
}

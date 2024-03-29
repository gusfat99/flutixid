part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeTheme extends ThemeEvent {
  final ThemeData themeData;

  const ChangeTheme({required this.themeData});

  @override
  List<Object> get props => [themeData];
}

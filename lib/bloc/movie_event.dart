part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();
}

class FetchMoviesOnPlaying extends MovieEvent {
  @override
  List<Object> get props => [];
}

class FetchMoviesComingSoon  extends MovieEvent {
  @override
  List<Object> get props => [];
}
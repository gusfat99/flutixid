part of 'movie_coming_bloc.dart';

abstract class MovieComingEvent extends Equatable {
  const MovieComingEvent();
}

class FetchMoviesComingSoon extends MovieComingEvent {
  @override
  List<Object> get props => [];
}
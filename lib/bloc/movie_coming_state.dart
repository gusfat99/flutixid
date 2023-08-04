part of 'movie_coming_bloc.dart';

abstract class MovieComingState extends Equatable {
  const MovieComingState();
}

class MovieComingInitial extends MovieComingState {
  @override
  List<Object> get props => [];
}

class MovieComingSoonLoaded extends MovieComingState {
  final List<Movie> movies;

  const MovieComingSoonLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}
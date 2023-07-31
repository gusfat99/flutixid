part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
}

class MovieOnPlayingInitial extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieOnPlayingLoaded extends MovieState {
  final List<Movie> movies;

  const MovieOnPlayingLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

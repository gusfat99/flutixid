import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieOnPlayingInitial()) {
    on<MovieEvent>((event, emit) async {
      // print('event on movie bloc ${event}');
      if(event is FetchMoviesOnPlaying) {
        List<Movie> movieList = await MovieService.getMovieOnPlaying(1);
        emit(MovieOnPlayingLoaded(movies: movieList.toList()));
      }
    });
  }
}

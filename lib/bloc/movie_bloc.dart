import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {

      if(event is FetchMoviesOnPlaying) {
        List<Movie> movieList = await MovieService.getMovieOnPlaying(1);
        emit(MovieOnPlayingLoaded(movies: movieList.toList()));
      }
    });
  }
}

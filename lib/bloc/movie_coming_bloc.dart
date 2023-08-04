import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutix/models/models.dart';
import 'package:flutix/services/services.dart';

part 'movie_coming_event.dart';
part 'movie_coming_state.dart';

class MovieComingBloc extends Bloc<MovieComingEvent, MovieComingState> {
  MovieComingBloc() : super(MovieComingInitial()) {
    on<MovieComingEvent>((event, emit) async {
      if(event is FetchMoviesComingSoon) {
        List<Movie> movieList = await MovieService.getMovieComingSoon(1);
        emit(MovieComingSoonLoaded(movies: movieList.toList()));
      }
    });
  }
}

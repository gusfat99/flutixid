import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeData())) {
    on<ThemeEvent>((event, emit) {
      // print(event);
      if(event is ChangeTheme) {
        emit(ThemeState(event.themeData));
      }
    });
  }
}

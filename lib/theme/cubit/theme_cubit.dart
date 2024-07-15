import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(ThemeState initialThemeState) : super(initialThemeState);

  void onChangeTheme(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.system:
        emit(const ThemeSystem());
        break;
      case ThemeMode.light:
        emit(const ThemeLight());
        break;
      case ThemeMode.dark:
        emit(const ThemeDark());
        break;
      default:
    }
  }
}

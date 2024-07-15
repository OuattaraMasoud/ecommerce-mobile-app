part of 'theme_cubit.dart';

abstract class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final Brightness? themeBrightness;
  const ThemeState({required this.themeMode, this.themeBrightness});

  @override
  List<Object> get props => [];
}

class ThemeSystem extends ThemeState {
  const ThemeSystem({Brightness? themeBrightness})
      : super(themeMode: ThemeMode.system, themeBrightness: themeBrightness);
}

class ThemeDark extends ThemeState {
  const ThemeDark()
      : super(themeMode: ThemeMode.dark, themeBrightness: Brightness.dark);
}

class ThemeLight extends ThemeState {
  const ThemeLight()
      : super(themeMode: ThemeMode.light, themeBrightness: Brightness.light);
}

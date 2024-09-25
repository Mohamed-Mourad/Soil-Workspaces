import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soil_flutter/data/shared_preferences.dart';

enum ThemeEvent { toggleTheme }
enum ThemeState { light, dark }

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.light) {
    _loadTheme();
    on<ThemeEvent>((event, emit) async {
      if (event == ThemeEvent.toggleTheme) {
        final newState = _getNextThemeState(state);
        emit(newState);
        CacheHelper.sharedPreferences.setInt(_themeKey, newState.index);
      }
    });
  }

  final String _themeKey = 'theme';

  Future<void> _loadTheme() async {
    final index = CacheHelper.sharedPreferences.getInt(_themeKey) ?? ThemeState.light.index;
    emit(ThemeState.values[index]);
  }

  ThemeState _getNextThemeState(ThemeState current) {
    switch (current) {
      case ThemeState.light:
        return ThemeState.dark;
      case ThemeState.dark:
        return ThemeState.light;
    }
  }
}

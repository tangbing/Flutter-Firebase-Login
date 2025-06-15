


import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  // void setTheme(ThemeMode theme) {
  //   emit(theme);
  // }

  void setLightTheme() {
    emit(ThemeMode.light);
  }

  void setDarkTheme() {
    emit(ThemeMode.dark);
  }

  void setSystemTheme() {
    emit(ThemeMode.system);
  }
  
  // void toggleTheme() {
  //   if (state == ThemeMode.light) {
  //     emit(ThemeMode.dark);
  //   } else if (state == ThemeMode.dark) {
  //     emit(ThemeMode.system);
  //   } else {
  //     emit(ThemeMode.light);
  //   }
  // }

}
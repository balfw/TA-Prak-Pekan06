import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Mengatur tema terang dan gelap untuk seluruh aplikasi.
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.light);

  void toggleTheme() {
    emit(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }

  void setTheme(ThemeMode mode) => emit(mode);
}

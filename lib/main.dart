import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/favorit_cubit.dart';
import 'cubit/pengajuan_cubit.dart';
import 'cubit/theme_cubit.dart';
import 'navigation/kerangka_navigasi.dart';
import 'pages/detail_layanan_page.dart';
import 'models/layanan.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => FavoritCubit()),
        BlocProvider(create: (_) => PengajuanCubit()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: const NusantaraCerdasApp(),
    ),
  );
}

class NusantaraCerdasApp extends StatelessWidget {
  const NusantaraCerdasApp({super.key});

  ThemeData _temaTerang() => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF176B87),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF6F8FA),
      );

  ThemeData _temaGelap() => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF64CCC5),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      );

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, mode) => MaterialApp(
        title: 'Nusantara Cerdas Mobile',
        debugShowCheckedModeBanner: false,
        theme: _temaTerang(),
        darkTheme: _temaGelap(),
        themeMode: mode,
        onGenerateRoute: (settings) {
          if (settings.name == DetailLayananPage.routeName) {
            final layanan = settings.arguments as Layanan;
            return MaterialPageRoute<void>(
              settings: settings,
              builder: (_) => DetailLayananPage(layanan: layanan),
            );
          }
          return MaterialPageRoute<void>(
            settings: settings,
            builder: (_) => const KerangkaNavigasi(),
          );
        },
        home: const KerangkaNavigasi(),
      ),
    );
  }
}

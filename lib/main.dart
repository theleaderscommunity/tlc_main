import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tlc_main/core/constants/colors.dart';
import 'package:tlc_main/features/splash/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: TlcMainApp()));
}

class TlcMainApp extends StatelessWidget {
  const TlcMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tlc',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.cream,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.burgundy,
          primary: AppColors.burgundy,
          secondary: AppColors.gold,
        ),
        textTheme: GoogleFonts.marcellusScTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

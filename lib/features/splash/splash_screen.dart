import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlc_main/core/constants/colors.dart';
import 'package:tlc_main/features/dashboard/navigation_shell.dart';
import 'package:tlc_main/features/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkInitialSession();
  }

  Future<void> _checkInitialSession() async {
    // Simulate a delay for the splash screen (e.g., 3 seconds)
    await Future.delayed(const Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    final bool completedOnboarding =
        prefs.getBool('completed_onboarding') ?? false;

    if (!mounted) return;

    // Navigate to the next screen (e.g., HomeScreen) after the splash screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => completedOnboarding ? const NavigationShell() : const OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.burgundy,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Replace with your real logo image asset once added to pubspec.yaml
            Icon(Icons.all_inclusive, size: 80, color: AppColors.gold),
            SizedBox(height: 24),
            Text(
              'T L C',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 8,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Wear Your Reminder',
              style: TextStyle(fontSize: 16, color: AppColors.gold, letterSpacing: 2),
            ),
          ],
        ),
      ),
    );
  }
}
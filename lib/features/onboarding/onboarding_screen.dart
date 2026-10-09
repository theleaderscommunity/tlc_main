import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/colors.dart';
import 'onboarding_model.dart';
import '../dashboard/navigation_shell.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  bool _isLastPage = false;

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('completed_onboarding', true);
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const NavigationShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: purusharthaData.length,
            onPageChanged: (index) {
              setState(() => _isLastPage = index == purusharthaData.length - 1);
            },
            itemBuilder: (context, index) {
              final page = purusharthaData[index];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: AppColors.burgundy.withValues(
                        alpha: 0.1,
                      ),
                      child: Icon(
                        page.icon,
                        size: 50,
                        color: AppColors.burgundy,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      page.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                        color: AppColors.burgundy,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      page.philosophy,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: AppColors.charcoal,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.gold.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Text(
                        page.productReminder,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: AppColors.charcoal.withValues(alpha: 0.8),
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 60,
            left: 32,
            right: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: purusharthaData.length,
                  effect: const WormEffect(
                    activeDotColor: AppColors.burgundy,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_isLastPage) {
                      _completeOnboarding();
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.burgundy,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                  ),
                  child: Text(_isLastPage ? 'EXPLORE' : 'NEXT'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

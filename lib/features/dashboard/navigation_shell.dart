// lib/features/dashboard/navigation_shell.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/colors.dart';
import 'dashboard_provider.dart';

class NavigationShell extends ConsumerWidget {
  const NavigationShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(dashboardProvider);
    final notifier = ref.read(dashboardProvider.notifier);

    final List<Widget> screens = [
      const Center(child: Text('🛒 Shop Space (WordPress API Integration)')),
      const Center(child: Text('👜 Shopping Cart Module')),
      const Center(child: Text('👤 User Profile Profile Setup')),
      state.hasMemberId
          ? const Center(
              child: Text('🕉️ Growth Matrix Unlocked (Supabase Workspace)'),
            )
          : const GrowthLockedPlaceholder(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('TLC PURUSHARTHA'),
        backgroundColor: AppColors.burgundy,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: IndexedStack(index: state.selectedIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.selectedIndex,
        onTap: (index) => notifier.changeTab(index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.burgundy,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.storefront_rounded),
            label: 'Shop',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              state.hasMemberId
                  ? Icons.insights_rounded
                  : Icons.lock_outline_rounded,
            ),
            label: 'Growth',
          ),
        ],
      ),
    );
  }
}

class GrowthLockedPlaceholder extends ConsumerWidget {
  const GrowthLockedPlaceholder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.lock_clock_outlined,
            size: 64,
            color: AppColors.gold,
          ),
          const SizedBox(height: 24),
          const Text(
            'Ecosystem Locked',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.burgundy,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'The Growth metric studio updates instantly once a Member_ID is active. Order your foundational Purushartha reminder garment from the webstore to activate your key.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          const SizedBox(height: 32),
          // Demo Button to mock backend unlocks locally during front-end prototyping phase
          TextButton.icon(
            onPressed: () =>
                ref.read(dashboardProvider.notifier).mockUnlockMemberAccess(),
            icon: const Icon(Icons.vpn_key),
            label: const Text('Simulate Purchase Verification (Unlock)'),
            style: TextButton.styleFrom(foregroundColor: AppColors.gold),
          ),
        ],
      ),
    );
  }
}

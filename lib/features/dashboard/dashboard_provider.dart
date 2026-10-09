// lib/features/dashboard/dashboard_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardState {
  final int selectedIndex;
  final bool hasMemberId; // The backend gate variable for Personal Development

  DashboardState({required this.selectedIndex, required this.hasMemberId});

  DashboardState copyWith({int? selectedIndex, bool? hasMemberId}) {
    return DashboardState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      hasMemberId: hasMemberId ?? this.hasMemberId,
    );
  }
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier()
    : super(DashboardState(selectedIndex: 0, hasMemberId: false));

  void changeTab(int index) => state = state.copyWith(selectedIndex: index);

  // Method will be tied to WordPress payment updates in Phase 4
  void mockUnlockMemberAccess() => state = state.copyWith(hasMemberId: true);
}

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
      return DashboardNotifier();
    });

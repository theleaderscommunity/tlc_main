// test/widget_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tlc_main/main.dart'; // Ensure this matches your package path to TlcMainApp

void main() {
  // Ensure shared preferences is mocked correctly for testing environment routing
  setUp(() {
    SharedPreferences.setMockInitialValues({'completed_onboarding': false});
  });

  testWidgets(
    'App structural lifecycle test: Splash to Onboarding flow verification',
    (WidgetTester tester) async {
      // 1. Boot up the real entrypoint wrapped in Riverpod scope
      await tester.pumpWidget(const ProviderScope(child: TlcMainApp()));

      // 2. VERIFY SPLASH IDENTITY STAGE:
      // Assert that the initial logo tagline text elements render on start
      expect(find.text('Wear Your Purpose'), findsOneWidget);
      expect(find.text('T L C'), findsOneWidget);

      // 3. TRIGGER SIMULATED ASSET TIMEOUT:
      // Your splash screen waits 3 seconds before routing. We advance time by 3 seconds.
      await tester.pump(const Duration(seconds: 3));

      // Settle transitions and routing animation frames smoothly
      await tester.pumpAndSettle();

      // 4. VERIFY ONBOARDING CAROUSEL MODULE STAGE:
      // Assert that the app successfully routed past splash to your first Purushartha pillar
      expect(find.text('DHARMA'), findsOneWidget);
      expect(find.text('NEXT'), findsOneWidget);

      // 5. NAVIGATE THROUGH CAROUSEL:
      // Tap next to move from Dharma to Artha
      await tester.tap(find.text('NEXT'));
      await tester.pumpAndSettle();

      // Assert that the view has updated state context gracefully to Artha pillar
      expect(find.text('ARTHA'), findsOneWidget);
    },
  );
}

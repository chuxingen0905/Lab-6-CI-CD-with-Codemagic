import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:prototype/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Test', () {
    testWidgets('full app test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Login screen tests
      final phoneNoFormField = find.byKey(const Key('phone_number_input_field'));
      final checkBox = find.byType(Checkbox);
      final activateButton = find.byType(ElevatedButton);

      expect(
        tester.getSemantics(checkBox),
        matchesSemantics(
          hasTapAction: true,
          hasCheckedState: true,
          isChecked: false,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
        ),
      );

      await tester.enterText(phoneNoFormField, "123456789");
      await tester.pumpAndSettle();
      await tester.tap(checkBox);
      await tester.pumpAndSettle();

      expect(
        tester.getSemantics(checkBox),
        matchesSemantics(
          hasTapAction: true,
          hasCheckedState: true,
          isChecked: true,
          hasEnabledState: true,
          isEnabled: true,
          isFocusable: true,
        ),
      );

      await tester.pump(const Duration(seconds: 1));
      await tester.tap(activateButton);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 1));

      // OTP confirmation tests
      await tester.enterText(find.byType(TextField), '562489');
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byType(ElevatedButton));
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Factory 1').last);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Factory 2').last);
      await tester.pumpAndSettle();

      final settingsIcon = find.byIcon(Icons.settings).last;

      await tester.tap(settingsIcon);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Factory 1').last);
      await tester.pumpAndSettle();

      // Edit the value in settings
      final editButton = find.byIcon(Icons.edit);
      final doneButton = find.byIcon(Icons.done);

      await tester.pump(const Duration(seconds: 1));
      await tester.tap(editButton);
      await tester.pumpAndSettle();

      await tester.pump(const Duration(seconds: 1));
      await tester.enterText(find.byType(TextFormField).first, '56');

      await tester.pump(const Duration(seconds: 1));
      await tester.tap(doneButton);
      await tester.pumpAndSettle();

      // Factory button 2 and 3
      await tester.tap(find.text('Factory 2').last);
      await tester.pumpAndSettle();

      // Profile page
      final personIcon = find.byIcon(Icons.person);

      await tester.tap(personIcon);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 1));
      await tester.tap(find.text('Factory 1').last);
      await tester.pumpAndSettle();

      final inviteFactory1 = find.byType(FloatingActionButton);

      final fac1Owner = find.byType(TextField).first;
      final fac1OwnerNumber = find.byType(TextField).last;
      final pressSubmit = find.byType(ElevatedButton);

      await tester.pump(const Duration(seconds: 1));
      await tester.tap(inviteFactory1);
      await tester.pump(const Duration(seconds: 1));
      await tester.enterText(fac1Owner, "John");
      await tester.pumpAndSettle();

      await tester.pump(const Duration(seconds: 1));
      await tester.enterText(fac1OwnerNumber, "15889957");
      await tester.pumpAndSettle();

      await tester.pump(const Duration(seconds: 1));
      await tester.tap(pressSubmit);
      await tester.pumpAndSettle();
    });
  });
}

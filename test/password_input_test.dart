import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/widgets/inputs/password_input.dart';

void main() {
  testWidgets('PasswordInput displays password label and hint', (WidgetTester tester) async {
    final textEditingController = TextEditingController();

    await tester.pumpWidget(
      GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: PasswordInput(
            textEditingController: textEditingController,
          ),
        ),
      ),
    );

    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Enter your password'), findsOneWidget);
  });

  testWidgets('PasswordInput toggles password visibility', (WidgetTester tester) async {
    final textEditingController = TextEditingController();

    await tester.pumpWidget(
      GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: PasswordInput(
            textEditingController: textEditingController,
          ),
        ),
      ),
    );

    // Initially, the password should be obscured
    expect(find.byIcon(CupertinoIcons.eye_slash), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.eye), findsNothing);

    // Tap the toggle button to show the password
    await tester.tap(find.byIcon(CupertinoIcons.eye_slash));
    await tester.pump();

    // Now, the password should be visible
    expect(find.byIcon(CupertinoIcons.eye), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.eye_slash), findsNothing);
  });
}

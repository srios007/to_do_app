import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/widgets/inputs/email_input.dart';

void main() {
  testWidgets('EmailInput displays email label and hint', (WidgetTester tester) async {
    final textEditingController = TextEditingController();

    await tester.pumpWidget(
      GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: EmailInput(
            textEditingController: textEditingController,
          ),
        ),
      ),
    );

    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Enter your email'), findsOneWidget);
  });


  testWidgets('EmailInput does not show error message when email is valid', (WidgetTester tester) async {
    final textEditingController = TextEditingController();

    await tester.pumpWidget(
      GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: Form(
            child: EmailInput(
              textEditingController: textEditingController,
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(TextFormField));
    await tester.enterText(find.byType(TextFormField), 'test@example.com');
    await tester.pump();

    // Trigger form validation
    await tester.tap(find.byType(TextFormField));
    await tester.pump();

    expect(find.text('Please enter a valid email address'), findsNothing);
  });
}

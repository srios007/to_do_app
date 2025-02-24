import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/widgets/inputs/normal_input.dart';

void main() {
  testWidgets('NormalInput displays title and hint', (WidgetTester tester) async {
    final textEditingController = TextEditingController();

    await tester.pumpWidget(
      GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: NormalInput(
            titleText: 'Title',
            hintText: 'Enter text',
            textEditingController: textEditingController,
          ),
        ),
      ),
    );

    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Enter text'), findsOneWidget);
  });


  testWidgets('NormalInput applies input formatters', (WidgetTester tester) async {
    final textEditingController = TextEditingController();
    final inputFormatter = FilteringTextInputFormatter.digitsOnly;

    await tester.pumpWidget(
      GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: NormalInput(
            titleText: 'Title',
            textEditingController: textEditingController,
            inputFormatters: [inputFormatter],
          ),
        ),
      ),
    );

    await tester.tap(find.byType(TextFormField));
    await tester.enterText(find.byType(TextFormField), '123abc');
    await tester.pump();

    expect(textEditingController.text, '123');
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/widgets/buttons/custom_button.dart';

void main() {
  testWidgets('CustomButton displays button text', (WidgetTester tester) async {
    final isLoading = false.obs;

    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: CustomButton(
            buttonText: 'Test Button',
            isLoading: isLoading,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);
  });

  testWidgets('CustomButton shows CircularProgressIndicator when loading', (WidgetTester tester) async {
    final isLoading = true.obs;

    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: CustomButton(
            buttonText: 'Test Button',
            isLoading: isLoading,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('CustomButton calls onPressed when not loading', (WidgetTester tester) async {
    final isLoading = false.obs;
    var pressed = false;

    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: CustomButton(
            buttonText: 'Test Button',
            isLoading: isLoading,
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(MaterialButton));
    await tester.pump();

    expect(pressed, isTrue);
  });

  testWidgets('CustomButton does not call onPressed when loading', (WidgetTester tester) async {
    final isLoading = true.obs;
    var pressed = false;

    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: CustomButton(
            buttonText: 'Test Button',
            isLoading: isLoading,
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byType(MaterialButton));
    await tester.pump();

    expect(pressed, isFalse);
  });
}

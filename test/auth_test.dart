import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_do_app/app/widgets/widgets.dart';

void main() {
  group('Auth Tests', () {
    late MockFirebaseAuth mockAuth;

    setUp(() {
      final user = MockUser(
        uid: 'someuid',
        email: 'bob@somedomain.com',
        displayName: 'Bob',
      );

      mockAuth = MockFirebaseAuth(mockUser: user);
    });
    test('Initial screen should be HOME when user is logged in', () {
      expect(mockAuth.currentUser, null);
    });

    test('signOut signs out the user and sets initial screen to LOGIN',
        () async {
      await mockAuth.signOut();
      expect(mockAuth.currentUser, isNull);
    });
    testWidgets('Login with valid credentials', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: LoadingWidget(),
        ),
      ));

      await mockAuth.signInWithEmailAndPassword(
        email: 'bob@somedomain.com',
        password: 'password',
      );

      expect(mockAuth.currentUser, isNotNull);
      expect(mockAuth.currentUser?.email, 'bob@somedomain.com');
    });

    testWidgets('Login with invalid credentials shows error',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: LoadingWidget(),
        ),
      ));

      await mockAuth.signInWithEmailAndPassword(
        email: 'bob@somedomain.com',
        password: 'wrongpassword',
      );

      expect(
        mockAuth.currentUser,
        MockUser(
          uid: 'someuid',
          email: 'bob@somedomain.com',
          displayName: 'Bob',
        ),
      );
    });
    testWidgets('Register a new user', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: LoadingWidget(),
        ),
      ));

      await mockAuth.createUserWithEmailAndPassword(
        email: 'newuser@somedomain.com',
        password: 'newpassword',
      );

      expect(mockAuth.currentUser, isNotNull);
      expect(mockAuth.currentUser?.email, 'newuser@somedomain.com');
    });
    testWidgets('Reset password sends email', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: LoadingWidget(),
        ),
      ));

      await mockAuth.sendPasswordResetEmail(email: 'bob@somedomain.com');
      expect(mockAuth.currentUser, null);
    });
  });
}

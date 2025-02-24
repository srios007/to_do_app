import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Tasks Tests', () {
    testWidgets('creates a task', (WidgetTester tester) async {
      final firestore = FakeFirebaseFirestore();
      await firestore.collection('tasks').add({
        'created_at': FieldValue.serverTimestamp(),
        'description': 'Prueba',
        'id': 'some_id',
        'isCompleted': false,
        'name': 'Nombre prueba',
        'translatedDescription': null,
        'translatedName': null,
        'userId': 'some_user_id',
      });

      final snapshot = await firestore.collection('tasks').get();
      expect(snapshot.docs.length, 1);
      expect(snapshot.docs.first['name'], 'Nombre prueba');
    });

    testWidgets('retrieves a list of tasks with a listener', (WidgetTester tester) async {
      final firestore = FakeFirebaseFirestore();
      await firestore.collection('tasks').add({
        'created_at': FieldValue.serverTimestamp(),
        'description': 'Prueba',
        'id': 'some_id',
        'isCompleted': false,
        'name': 'Nombre prueba',
        'translatedDescription': null,
        'translatedName': null,
        'userId': 'some_user_id',
      });

      final tasksStream = firestore.collection('tasks').snapshots();
      tasksStream.listen((snapshot) {
        expect(snapshot.docs.length, 1);
        expect(snapshot.docs.first['name'], 'Nombre prueba');
      });
    });

    testWidgets('updates a task', (WidgetTester tester) async {
      final firestore = FakeFirebaseFirestore();
      final docRef = await firestore.collection('tasks').add({
        'created_at': FieldValue.serverTimestamp(),
        'description': 'Prueba',
        'id': 'some_id',
        'isCompleted': false,
        'name': 'Nombre prueba',
        'translatedDescription': null,
        'translatedName': null,
        'userId': 'some_user_id',
      });

      await firestore.collection('tasks').doc(docRef.id).update({
        'name': 'Nombre actualizado',
      });

      final snapshot = await firestore.collection('tasks').doc(docRef.id).get();
      expect(snapshot['name'], 'Nombre actualizado');
    });

    testWidgets('deletes a task', (WidgetTester tester) async {
      final firestore = FakeFirebaseFirestore();
      final docRef = await firestore.collection('tasks').add({
        'created_at': FieldValue.serverTimestamp(),
        'description': 'Prueba',
        'id': 'some_id',
        'isCompleted': false,
        'name': 'Nombre prueba',
        'translatedDescription': null,
        'translatedName': null,
        'userId': 'some_user_id',
      });

      await firestore.collection('tasks').doc(docRef.id).delete();

      final snapshot = await firestore.collection('tasks').get();
      expect(snapshot.docs.length, 0);
    });
  });
}

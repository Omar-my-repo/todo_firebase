import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/task.dart';

CollectionReference<Task> getCollectionRef() {
  return FirebaseFirestore.instance.collection('Tasks').withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
        toFirestore: (task, options) => task.toJson(),
      );
}

Future<void> addTaskToFirestore(Task task) async {
  var collection = getCollectionRef();
  var docRef = collection.doc();
  task.id = docRef.id;
  return await docRef.set(task);
}

Stream<QuerySnapshot<Task>> getTaskFromFirestore(DateTime selectedDate) {
  var collection = getCollectionRef();
  return collection
      .where('date',
          isEqualTo: DateUtils.dateOnly(selectedDate).microsecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteTaskFromFirestore(String id) {
  var collection = getCollectionRef();
  return collection.doc(id).delete();
}

Future<void> updateTaskFromFirestore(String id, Task task) {
  var collection = getCollectionRef();
  return collection.doc(id).set(task);
}

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../constants.dart';

Stream<QuerySnapshot> getPostSnapshots() {
  return FirebaseFirestore.instance
      .collection('posts')
      .orderBy('date', descending: true)
      .snapshots();
}

Future<DocumentReference> addPost(File image, int quantity) async {
  final storageReference = FirebaseStorage.instance
      .ref()
      .child(DateTime.now().millisecondsSinceEpoch.toString());

  await storageReference.putFile(image);

  return FirebaseFirestore.instance.collection('posts').add({
    'date': DateTime.now(),
    'imageURL': await storageReference.getDownloadURL(),
    'quantity': quantity,
    'latitude': latitude,
    'longitude': longitude,
  });
}

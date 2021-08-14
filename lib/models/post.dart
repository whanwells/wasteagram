import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final DateTime date;
  final String imageURL;
  final int quantity;
  final double latitude;
  final double longitude;

  Post({
    required this.date,
    required this.imageURL,
    required this.quantity,
    required this.latitude,
    required this.longitude,
  });

  Post.fromSnapshot(QueryDocumentSnapshot snapshot)
      : date = snapshot['date'].toDate(),
        imageURL = snapshot['imageURL'],
        quantity = snapshot['quantity'],
        latitude = snapshot['latitude'],
        longitude = snapshot['longitude'];
}

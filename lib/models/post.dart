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

  Post.fromMap(Map<String, dynamic> map)
      : date = map['date'],
        imageURL = map['imageURL'],
        quantity = map['quantity'],
        latitude = map['latitude'],
        longitude = map['longitude'];
}

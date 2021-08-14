import 'package:test/test.dart';
import 'package:wasteagram/models/post.dart';

void main() {
  test('creates Post from Map', () {
    final date = DateTime(2021, 1, 1);
    const url = 'http://example.com/foo.png';
    const quantity = 2;
    const latitude = 2.0;
    const longitude = 3.0;

    final post = Post.fromMap({
      'date': date,
      'imageURL': url,
      'quantity': quantity,
      'latitude': latitude,
      'longitude': longitude,
    });

    expect(post.date, date);
    expect(post.imageURL, url);
    expect(post.quantity, quantity);
    expect(post.latitude, latitude);
    expect(post.longitude, longitude);
  });
}

import 'package:flutter/material.dart';
import '../models/post.dart';
import '../utils/date.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(formatDate(post.date), style: theme.textTheme.headline6),
          SizedBox(height: 12),
          Image.network(
            post.imageURL,
            loadingBuilder: (context, child, progress) {
              return progress == null ? child : CircularProgressIndicator();
            },
          ),
          SizedBox(height: 12),
          Text('Items: ${post.quantity}', style: theme.textTheme.headline6),
          SizedBox(height: 12),
          Text('(${post.latitude}, ${post.longitude})'),
        ],
      ),
    );
  }
}

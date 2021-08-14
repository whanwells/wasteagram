import 'package:flutter/material.dart';
import '../models/post.dart';
import '../utils/date.dart';
import './post_detail_image.dart';

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
          const SizedBox(height: 12),
          PostDetailImage(url: post.imageURL),
          const SizedBox(height: 12),
          Text('Items: ${post.quantity}', style: theme.textTheme.headline6),
          const SizedBox(height: 12),
          Text('(${post.latitude}, ${post.longitude})'),
        ],
      ),
    );
  }
}

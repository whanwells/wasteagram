import 'package:flutter/material.dart';
import '../models/post.dart';
import '../utils/date.dart';

class PostListTile extends StatelessWidget {
  final Post post;

  const PostListTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(formatDate(post.date)),
      trailing: Text(post.quantity.toString()),
    );
  }
}

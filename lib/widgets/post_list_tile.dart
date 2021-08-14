import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/post.dart';

class PostListTile extends StatelessWidget {
  static final _dateFormatter = DateFormat('EEEE, MMMM d, y');

  final Post post;

  const PostListTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_dateFormatter.format(post.date)),
      trailing: Text(post.quantity.toString()),
    );
  }
}

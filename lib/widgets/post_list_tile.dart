import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostListTile extends StatelessWidget {
  static final _dateFormatter = DateFormat('EEEE, MMMM d, y');

  final QueryDocumentSnapshot post;

  const PostListTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_dateFormatter.format(post['date'].toDate())),
      trailing: Text(post['quantity'].toString()),
    );
  }
}

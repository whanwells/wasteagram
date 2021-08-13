import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostListView extends StatelessWidget {
  static final _dateFormatter = DateFormat('EEEE, MMMM d, y');

  final List<QueryDocumentSnapshot> posts;

  const PostListView({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(_dateFormatter.format(post['date'].toDate())),
          );
        });
  }
}

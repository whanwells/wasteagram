import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widgets/post_list_tile.dart';

class PostListView extends StatelessWidget {
  final List<QueryDocumentSnapshot> posts;

  const PostListView({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostListTile(
        post: Post.fromMap(posts[index].data() as Map<String, dynamic>),
      ),
    );
  }
}

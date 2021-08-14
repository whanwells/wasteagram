import 'package:flutter/material.dart';
import '../models/post.dart';
import '../widgets/post_detail.dart';
import '../constants.dart';

class DetailScreen extends StatelessWidget {
  final Post post;

  const DetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: PostDetail(post: post),
      ),
    );
  }
}

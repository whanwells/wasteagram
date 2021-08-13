import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/post_list_view.dart';

class PostStream extends StatefulWidget {
  const PostStream({Key? key}) : super(key: key);

  @override
  _PostStreamState createState() => _PostStreamState();
}

class _PostStreamState extends State<PostStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData ||
            snapshot.data?.docs == null ||
            snapshot.data!.docs.length == 0) {
          return const Center(child: CircularProgressIndicator());
        }

        return PostListView(posts: snapshot.data!.docs);
      },
    );
  }
}

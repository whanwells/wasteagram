import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostStream extends StatefulWidget {
  const PostStream({Key? key}) : super(key: key);

  @override
  _PostStreamState createState() => _PostStreamState();
}

class _PostStreamState extends State<PostStream> {
  static final _dateFormatter = DateFormat('EEEE, MMMM d, y');

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

        return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final post = snapshot.data!.docs[index];
              return ListTile(
                title: Text(_dateFormatter.format(post['date'].toDate())),
              );
            });
      },
    );
  }
}

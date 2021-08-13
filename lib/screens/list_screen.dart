import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../widgets/app_title.dart';
import 'new_post_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  static final _dateFormatter = DateFormat('EEEE, MMMM d, y');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(),
      ),
      body: StreamBuilder(
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
                    title: Text(_dateFormatter.format(post['date'].toDate())));
              });
        },
      ),
      floatingActionButton: Semantics(
        button: true,
        onTapHint: 'Select an image',
        child: FloatingActionButton(
          onPressed: () async {
            final image = await _pickImage();
            if (image != null) {
              _pushNewPostScreen(context, image);
            }
          },
          child: Icon(Icons.photo),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<XFile?> _pickImage() {
    return ImagePicker().pickImage(source: ImageSource.gallery);
  }

  void _pushNewPostScreen(BuildContext context, XFile image) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewPostScreen(image: image)));
  }
}

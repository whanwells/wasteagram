import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/app_title.dart';
import 'new_post_screen.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(),
      ),
      body: Center(
        child: CircularProgressIndicator(),
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

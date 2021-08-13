import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/new_post_screen.dart';

class ImagePickerFab extends StatelessWidget {
  static final _picker = ImagePicker();

  const ImagePickerFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Semantics(
          button: true,
          onTapHint: 'Select an image',
          child: FloatingActionButton(
            onPressed: () async {
              final image = await _pick();
              if (image != null) {
                _pushNewPostScreen(context, image);
              }
            },
            child: Icon(Icons.photo),
          ));
    });
  }

  Future<XFile?> _pick() {
    return _picker.pickImage(source: ImageSource.gallery);
  }

  void _pushNewPostScreen(BuildContext context, XFile image) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => NewPostScreen(image: image)));
  }
}

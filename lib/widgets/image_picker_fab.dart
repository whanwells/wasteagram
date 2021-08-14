import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../screens/new_post_screen.dart';

class ImagePickerFab extends StatelessWidget {
  static final _picker = ImagePicker();

  const ImagePickerFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Semantics(
        button: true,
        onTapHint: 'Select an image',
        child: FloatingActionButton(
          child: const Icon(Icons.photo),
          onPressed: () async {
            final image = await _picker.pickImage(source: ImageSource.gallery);
            if (image == null) return;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewPostScreen(image: image),
              ),
            );
          },
        ),
      ),
    );
  }
}

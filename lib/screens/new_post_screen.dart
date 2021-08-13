import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/new_post_form.dart';
import '../constants.dart';

class NewPostScreen extends StatelessWidget {
  final XFile image;

  const NewPostScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: NewPostForm(image: image),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

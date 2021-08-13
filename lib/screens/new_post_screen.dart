import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/app_title.dart';

class NewPostScreen extends StatelessWidget {
  final XFile image;

  const NewPostScreen({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTitle(),
      ),
      body: Image.file(File(image.path)),
    );
  }
}

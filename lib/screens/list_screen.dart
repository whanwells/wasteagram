import 'package:flutter/material.dart';
import '../widgets/image_picker_fab.dart';
import '../widgets/post_stream.dart';
import '../constants.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appName),
      ),
      body: const PostStream(),
      floatingActionButton: const ImagePickerFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

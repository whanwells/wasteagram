import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../widgets/upload_button.dart';
import '../widgets/wasted_item_count_field.dart';

class NewPostForm extends StatefulWidget {
  final XFile image;

  const NewPostForm({Key? key, required this.image}) : super(key: key);

  @override
  _NewPostFormState createState() => _NewPostFormState();
}

class _NewPostFormState extends State<NewPostForm> {
  final _formKey = GlobalKey<FormState>();
  var _quantity = 0;

  @override
  Widget build(BuildContext context) {
    final image = File(widget.image.path);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(child: Image.file(image)),
          SizedBox(height: 12),
          Expanded(
            child: WastedItemCountField(
              onSaved: (value) => _quantity = value!,
            ),
          ),
          Spacer(),
          UploadButton(onPressed: () async {
            if (!_formKey.currentState!.validate()) {
              return;
            }

            _formKey.currentState!.save();

            final storageReference = FirebaseStorage.instance
                .ref()
                .child(DateTime.now().millisecondsSinceEpoch.toString());

            await storageReference.putFile(image);

            FirebaseFirestore.instance.collection('posts').add({
              'date': DateTime.now(),
              'imageURL': await storageReference.getDownloadURL(),
              'quantity': _quantity,
            });

            Navigator.of(context).pop();
          }),
        ],
      ),
    );
  }
}

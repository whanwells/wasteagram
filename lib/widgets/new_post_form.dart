import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/upload_button.dart';

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
            child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: 'Number of Wasted Items',
              ),
              textAlign: TextAlign.center,
              validator: (value) {
                return value == null || value.isEmpty
                    ? 'Number of wasted items is required'
                    : null;
              },
              onSaved: (value) {
                _quantity = int.parse(value!);
              },
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

import 'dart:io';
import 'package:image_picker/image_picker.dart';
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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: Image.file(File(widget.image.path)),
          ),
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
                // TODO
              },
            ),
          ),
          Spacer(),
          UploadButton(onPressed: () {
            // TODO
          }),
        ],
      ),
    );
  }
}

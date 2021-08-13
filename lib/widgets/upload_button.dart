import 'package:flutter/material.dart';

class UploadButton extends StatelessWidget {
  final void Function() onPressed;

  const UploadButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Semantics(
        button: true,
        onTapHint: 'Create post',
        child: ElevatedButton(
          child: Icon(
            Icons.cloud_upload,
            size: 40,
          ),
          style: ElevatedButton.styleFrom(padding: EdgeInsets.all(16)),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

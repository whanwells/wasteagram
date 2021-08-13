import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram'),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
      floatingActionButton: Semantics(
        button: true,
        onTapHint: 'Select an image',
        child: FloatingActionButton(
          onPressed: () => {},
          child: Icon(Icons.photo),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

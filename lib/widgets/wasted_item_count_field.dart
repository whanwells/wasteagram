import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WastedItemCountField extends StatelessWidget {
  final Function(int? value) onSaved;

  const WastedItemCountField({Key? key, required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        onSaved(int.tryParse(value!));
      },
    );
  }
}

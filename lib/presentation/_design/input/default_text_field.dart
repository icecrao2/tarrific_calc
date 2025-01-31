import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;

  const DefaultTextField({super.key, required this.textEditingController, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: labelText,
      ),
      style: const TextStyle(
          color: Color.fromRGBO(76, 106, 255, 1), fontWeight: FontWeight.w700),
    );
  }
}

import 'package:flutter/material.dart';

class TitleContentText extends StatelessWidget {

  final String title;
  final String content;

  const TitleContentText({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text('$title: ',
            style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          flex: 4,
          child: Text(content,
            style: const TextStyle(fontSize: 18, color: Colors.black)),
        )
      ],
    );
  }
}

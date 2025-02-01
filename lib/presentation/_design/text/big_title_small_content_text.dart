import 'package:flutter/material.dart';

class BigTitleSmallContentText extends StatelessWidget {

  final String title;
  final String content;

  const BigTitleSmallContentText({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Text('$title: ',
              style: const TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        Expanded(
          flex: 2,
          child: Text(content,
              style: const TextStyle(fontSize: 16, color: Colors.black)),
        )
      ],
    );
  }
}

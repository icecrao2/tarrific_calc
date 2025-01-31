import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchHsScreen extends StatelessWidget {

  final _textEditingController = TextEditingController();

  SearchHsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HS 코드 찾기'
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textEditingController,
            autocorrect: false,
            decoration: const InputDecoration(
              labelText: "품명 입력",
            ),
            style: const TextStyle(
              color: Color.fromRGBO(76, 106, 255, 1),
              fontWeight: FontWeight.w700
            ),
          ),
        ],
      ),
    );
  }
}

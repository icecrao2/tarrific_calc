import 'package:flutter/material.dart';

class SearchHsCodeButtonComponent extends StatelessWidget {
  const SearchHsCodeButtonComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text("HS 코드 찾기"),
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)))),
    );
  }
}

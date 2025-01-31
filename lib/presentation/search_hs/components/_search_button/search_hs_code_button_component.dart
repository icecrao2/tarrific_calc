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
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12))),
        child:const  Text("HS 코드 찾기")),
    );
  }
}

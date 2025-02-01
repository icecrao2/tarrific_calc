import 'package:flutter/material.dart';

typedef StringCallback = void Function(String str);

class ToggleButtonRadio extends StatefulWidget {

  final List<String> options;
  final StringCallback onTap;
  const ToggleButtonRadio({super.key, required this.options, required this.onTap});

  @override
  State<ToggleButtonRadio> createState() => _ToggleButtonRadioState();
}

class _ToggleButtonRadioState extends State<ToggleButtonRadio> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: List.generate(widget.options.length, (index) => index == _selectedIndex),
      onPressed: (index) {
        setState(() {
          widget.onTap(widget.options[index]);
          _selectedIndex = index;
        });
      },
      fillColor: Colors.white,
      children: widget.options.map((e) => Container(
        width: 40,
        height: 45,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(e, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),),
      )).toList(),
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';

class ToggleButtonRadio extends StatefulWidget {
  final ToggleButtonRadioController controller;

  const ToggleButtonRadio({super.key, required this.controller});

  @override
  State<ToggleButtonRadio> createState() => _ToggleButtonRadioState();
}

class _ToggleButtonRadioState extends State<ToggleButtonRadio> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ToggleButtons(
        isSelected: List.generate(widget.controller.options.length, (index) => index == _selectedIndex),
        onPressed: (index) {
          setState(() {
            _selectedIndex = index;
            widget.controller.controller.add(widget.controller.options[index]);
          });
        },
        fillColor: Colors.white,
        children: widget.controller.options.map((e) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(e, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11),),
        )).toList(),
      )
    );
  }
}

class ToggleButtonRadioController {
  final StreamController controller;
  Stream get stream => controller.stream;
  final List<String> options;

  const ToggleButtonRadioController({
    required this.controller,
    required this.options});
}
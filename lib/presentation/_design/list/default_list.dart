import 'package:flutter/material.dart';

class DefaultList extends StatelessWidget {
  final List<DefaultListElementUiModel> elements;

  const DefaultList({super.key, required this.elements});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListView.builder(
        itemCount: elements.length,
        shrinkWrap: true,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              key: ValueKey(index),
              contentPadding: const EdgeInsets.only(left: 10, right: 0),
              leading: elements[index].leading,
              title: elements[index].center,
              trailing: elements[index].trailing,
              dense: true,
            ),
          );
        },
      ),
    );
  }
}

class DefaultListElementUiModel {
  final Widget leading;
  final Widget center;
  final Widget trailing;

  const DefaultListElementUiModel(
      {required this.leading, required this.center, required this.trailing});
}

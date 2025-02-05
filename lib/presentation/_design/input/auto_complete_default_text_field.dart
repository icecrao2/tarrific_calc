import 'package:flutter/material.dart';

import '../setting.dart';

class AutoCompleteDefaultTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final List<String> suggestions;


  const AutoCompleteDefaultTextField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.suggestions,
  });

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return suggestions.where(
              (item) => item.toLowerCase().contains(textEditingValue.text.toLowerCase()),
        );
      },
      onSelected: (String selection) {
        textEditingController.text = selection;
      },
      fieldViewBuilder: (context, autocompleteController, focusNode, onFieldSubmitted) {
        return TextField(
          controller: autocompleteController,
          focusNode: focusNode,
          decoration: InputDecoration(
            labelText: labelText,
          ),
          style: const TextStyle(
            color: Color.fromRGBO(76, 106, 255, 1),
            fontWeight: FontWeight.w700,
          ),
          onChanged: (value) {
            textEditingController.text = value;
          },
          onSubmitted: (value) {
            onFieldSubmitted();
          },
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: options.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (BuildContext context, int index) {
              final String option = options.elementAt(index);
              return Container(
                margin: const EdgeInsets.only(right:LAYOUT_HORIZON_PADDING * 2),
                color: Colors.white,
                child: GestureDetector(
                  onTap: () => onSelected(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey.shade600, size: 20),
                        const SizedBox(width: 10),
                        Text(
                          option,
                          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        );
      },
    );
  }
}

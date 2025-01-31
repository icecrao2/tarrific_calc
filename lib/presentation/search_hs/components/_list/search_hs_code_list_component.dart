import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tariff_calc/presentation/_design/list/default_list.dart';
import 'package:tariff_calc/presentation/search_hs/components/_list/search_hs_code_list_element_ui_model.dart';

class SearchHsCodeListComponent extends StatelessWidget {

  final List<SearchHsCodListElementUiModel> elements;

  const SearchHsCodeListComponent({super.key, required this.elements});

  @override
  Widget build(BuildContext context) {

    return DefaultList(
      elements: elements.map((element) => DefaultListElementUiModel(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                element.koreanName,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                element.englishName,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          center: Center(
            child: Text(
              element.hsCode,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          trailing:  IconButton(
            onPressed: () async {
              await Clipboard.setData(ClipboardData(text: element.hsCode));
              if(context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('hs 코드를 복사하였습니다!'),
                      duration: Duration(seconds: 2),
                    )
                );
              }
            },
            icon: const Icon(
              Icons.copy,
              size: 20,
            ))
      )).toList()
    );
  }
}

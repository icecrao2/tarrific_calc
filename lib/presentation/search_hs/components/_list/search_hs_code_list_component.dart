import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/_design/list/default_list.dart';

import '../../config/di.dart';

class SearchHsCodeListComponent extends ConsumerWidget {

  const SearchHsCodeListComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(hsCodeListStateProvider);

    return DefaultList(
      elements: state.map((element) => DefaultListElementUiModel(
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

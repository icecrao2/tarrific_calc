import 'package:flutter/material.dart';
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              '품명',
              maxLines: 1,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              element.koreanName.isNotEmpty ? element.koreanName : element.englishName,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        center: Center(
          child: Column(
            children: [
              const Text(
                'HS Code',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                element.hsCode,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        ),
        trailing: const SizedBox.shrink(),
        onTap: () {

        }
      )).toList()
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tariff_calc/domain/hs_code/entity/hs_code_entity.dart';

import '../../../_design/list/default_list.dart';
import '../../../tariff_lookup/tariff_lookup_screen.dart';

class SearchHsCodeListComponentDesign extends StatelessWidget {

  final List<HsCodeEntity> hsCodeList;

  const SearchHsCodeListComponentDesign({super.key, required this.hsCodeList});

  @override
  Widget build(BuildContext context) {
    return DefaultList(
        elements: hsCodeList.map((element) => DefaultListElementUiModel(
            leading: SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    '품명',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    element.koreanName.isNotEmpty ? element.koreanName : element.englishName,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TariffLookupScreen(hsCode: element.hsCode),
                ),
              );
            }
        )).toList()
    );
  }
}

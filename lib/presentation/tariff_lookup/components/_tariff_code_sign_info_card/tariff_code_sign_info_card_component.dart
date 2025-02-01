

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/tariff_lookup/config/di.dart';

import '../../../_design/text/big_title_small_content_text.dart';

class TariffCodeSignInfoCardComponent extends ConsumerWidget {

  const TariffCodeSignInfoCardComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tariffInfoStateProvider);



    return state.when(
      data: (data) {
        return SizedBox(
          width: MediaQuery
              .sizeOf(context)
              .width,
          child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    BigTitleSmallContentText(
                      title: "${data.tariffTypeName} 세율",
                      content: "${data.tariffRate}%",
                    ),
                    const SizedBox(height: 10,),
                    BigTitleSmallContentText(
                      title: "기준가격",
                      content: "${data.basePrice ?? '-'}",
                    ),
                    const SizedBox(height: 10,),
                    BigTitleSmallContentText(
                      title: "단위당 세액",
                      content: "${data.unitTax ?? '-'}",
                    ),
                  ],
                ),
              )
          ),
        );
      },
      error: (error, stack) => const SizedBox.shrink(),
      loading: () => const SizedBox(
        width: double.infinity,
        height: 100,
        child: Card(
          child: Center(
            child: Text("세율 타입을 선택하세요.",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
              ),),
          )
        ),
      )
    );
  }
}

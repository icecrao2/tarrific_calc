import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/tariff_lookup/config/di.dart';

import '../../../_design/text/title_content_text.dart';

class DefaultTariffInfoCardComponent extends ConsumerStatefulWidget {
  final String hsCode;

  const DefaultTariffInfoCardComponent({super.key, required this.hsCode});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DefaultTariffInfoCardComponentState();
}

class _DefaultTariffInfoCardComponentState
    extends ConsumerState<DefaultTariffInfoCardComponent> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(defaultInfoStateProvider.notifier).load(widget.hsCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(defaultInfoStateProvider);

    return state.when(
        data: (data) {
          return SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Card(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleContentText(
                        title: "Hs Code",
                        content: data.hsCode,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TitleContentText(
                        title: "품명",
                        content: data.koreanName.isNotEmpty
                            ? data.koreanName
                            : data.englishName,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TitleContentText(
                        title: "단위",
                        content: data.unit,
                      ),
                    ],
                  ),
                )),
          );
        },
        error: (error, stack) => const SizedBox.shrink(),
        loading: () => const CircularProgressIndicator());
  }
}

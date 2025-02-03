import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/tariff_lookup/config/di.dart';

import 'default_tariff_info_card_component_design.dart';

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
      ref
          .read(defaultTariffInfoCardComponentVmProvider.notifier)
          .load(widget.hsCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(defaultTariffInfoCardComponentVmProvider);
    return state.when(
        data: (data) => DefaultTariffInfoCardComponentDesign(data: data),
        error: (error, stack) => const SizedBox.shrink(),
        loading: () => const CircularProgressIndicator());
  }
}

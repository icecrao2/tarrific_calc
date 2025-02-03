import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/tariff_lookup/components/_tariff_code_sign_info_card/tariff_code_sign_info_card_component_design.dart';
import 'package:tariff_calc/presentation/tariff_lookup/config/di.dart';

class TariffCodeSignInfoCardComponent extends ConsumerStatefulWidget {
  const TariffCodeSignInfoCardComponent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TariffCodeSignInfoCardComponentState();
}

class _TariffCodeSignInfoCardComponentState extends ConsumerState<TariffCodeSignInfoCardComponent> {

  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = ref.watch(actionStreamControllerProvider);

      _subscription = controller.stream.listen((state) {
        final vm = ref.read(tariffCodeSignInfoCardComponentVmProvider.notifier);
        vm.load(tariffTypeCode: state);
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(tariffCodeSignInfoCardComponentVmProvider);

    return vm.when(
        data: (data) => TariffCodeSignInfoCardComponentDesign(data: data),
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

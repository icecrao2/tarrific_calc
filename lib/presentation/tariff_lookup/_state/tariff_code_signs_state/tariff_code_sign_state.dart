import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/domain/tariff_info/repository/tariff_info_repository.dart';

class TariffCodeSignsState extends StateNotifier<List<String>> {
  final TariffInfoRepository _tariffInfoRepository;

  TariffCodeSignsState({
    required TariffInfoRepository tariffInfoRepository,
    required String hsCode
  })
      : _tariffInfoRepository = tariffInfoRepository,
        super([]) {
    load(hsCode: hsCode);
  }

  Future<void> load({required String hsCode}) async {
    state = await _tariffInfoRepository.getCodeSigns(hsCode: hsCode);
  }
}


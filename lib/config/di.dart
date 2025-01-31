
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/data/repository/hs_code/hs_code_list_repository_uni_pass.dart';
import 'package:tariff_calc/domain/hs_code/repository/hs_code_list_repository.dart';



final hsCodeListRepositoryProvider = Provider<HsCodeListRepository>((ref) => HsCodeListRepositoryUniPass());

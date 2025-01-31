import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tariff_calc/presentation/search_hs/config/di.dart';

import '../../../_design/button/primary_button.dart';

class SearchHsCodeButtonComponent extends ConsumerWidget {
  const SearchHsCodeButtonComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final actor = ref.read(searchHsCodeButtonComponentActorProvider);

    return PrimaryButton(
      text: "HS 코드 찾기",
      onPressed: () {
        actor.search();
      },
    );
  }
}

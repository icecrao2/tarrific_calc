
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'input_text_controller_state.g.dart';

@riverpod
TextEditingController inputTextControllerState(Ref ref) => TextEditingController();

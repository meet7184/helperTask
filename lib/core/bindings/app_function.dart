import 'package:flutter/cupertino.dart';

void disposeKeyboard() {
  return FocusManager.instance.primaryFocus?.unfocus();
}

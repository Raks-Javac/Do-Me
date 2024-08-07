import 'package:dome/core/navigation/navigator_key.dart';
import 'package:flutter/material.dart';

void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

BuildContext getAppContext() {
  return NavigatorKey.appNavigatorKey.currentContext!;
}

String removeSeconds(String time) {
  if (time.endsWith(':00')) {
    return time.substring(0, time.length - 3);
  }
  return time;
}

extension StringExtension on String {
  bool isNumeric() {
    return double.tryParse(this) != null;
  }
}

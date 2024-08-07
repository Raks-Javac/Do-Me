import 'package:dome/core/utils/helper_functions/functions.dart';
import 'package:dome/res/theme/app_palette.dart';
import 'package:dome/res/theme/app_typography.dart';
import 'package:flutter/material.dart';

extension AppTheme on BuildContext {
  ThemeData get appTheme => Theme.of(this);
  BPallete? get pallete => Theme.of(this).extension<BPallete>();
  BTypography? get typography => Theme.of(this).extension<BTypography>();
  Size get appScreenSize => MediaQuery.of(this).size;
  TextTheme get appTextTheme => appTheme.textTheme;

  pushWidget(Widget routeWidget) {
    Navigator.push(
      this,
      MaterialPageRoute(builder: (context) => routeWidget),
    );
  }
}

extension PaddingExtension on Widget {
  Widget paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingOnly(
      {double right = 0.0,
      double left = 0.0,
      double top = 0.0,
      double bottom = 0.0}) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }
}

//
extension MarginExtension on Widget {
  Widget marginSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget marginOnly(
      {double right = 0.0,
      double left = 0.0,
      double top = 0.0,
      double bottom = 0.0}) {
    return Container(
      margin:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Widget marginAll(double value) {
    return Container(
      margin: EdgeInsets.all(value),
      child: this,
    );
  }
}

//center extension
extension CenterExtension on Widget {
  Widget get center {
    return Center(
      child: this,
    );
  }
}

//gesture extenstion

extension GestureExtension on Widget {
  Widget get dismissK {
    return GestureDetector(
      onTap: () {
        dismissKeyboard();
      },
      child: this,
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String removeHtmlTags() {
    return replaceAll(RegExp(r'<[^>]*>', multiLine: true), '');
  }

  String removeFirstCharacter() {
    List ch = split('');
    String word = "";
    ch.removeAt(0);
    for (var element in ch) {
      word += element;
    }
    return word;
  }

  String capitalizeEachWord() {
    if (trim().isEmpty) {
      return this;
    }
    return split(' ')
        .map((element) =>
            "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}")
        .join(" ");
  }
}

extension NairaSymbolExtension on String {
  String withNairaSymbol() {
    return '\u20A6$this';
  }
}

//widget life cycle extention
extension KoboToNaira on int? {
  // Convert kobo to naira
  double? toNaira() {
    if (this == null) return null;
    return double.parse((this! / 100).toStringAsFixed(2));
  }
}

extension NairaToKobo on double? {
  // Convert naira to kobo
  int? toKobo() {
    if (this == null) return null;
    return (this! * 100).round();
  }
}

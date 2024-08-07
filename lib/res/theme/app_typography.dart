import 'package:flutter/material.dart';

@immutable
class BTypography extends ThemeExtension<BTypography> {
  const BTypography({
    required this.text72,
    required this.text60,
    required this.text48,
    required this.text36,
    required this.text30,
    required this.text24,
    required this.text20,
    required this.text18,
    required this.text16,
    required this.text14,
    required this.text12,
  });

  final TextStyle? text72;
  final TextStyle? text60;
  final TextStyle? text48;
  final TextStyle? text36;
  final TextStyle? text30;
  final TextStyle? text24;
  final TextStyle? text20;
  final TextStyle? text18;
  final TextStyle? text16;
  final TextStyle? text14;
  final TextStyle? text12;

  @override
  BTypography copyWith({
    TextStyle? text72,
    TextStyle? text60,
    TextStyle? text48,
    TextStyle? text36,
    TextStyle? text30,
    TextStyle? text24,
    TextStyle? text20,
    TextStyle? text18,
    TextStyle? text16,
    TextStyle? text14,
    TextStyle? text12,
  }) {
    return BTypography(
      text72: text72 ?? this.text72,
      text60: text60 ?? this.text60,
      text48: text48 ?? this.text48,
      text36: text36 ?? this.text36,
      text30: text30 ?? this.text30,
      text24: text24 ?? this.text24,
      text20: text20 ?? this.text20,
      text18: text18 ?? this.text18,
      text16: text16 ?? this.text16,
      text14: text14 ?? this.text14,
      text12: text12 ?? this.text12,
    );
  }

  @override
  BTypography lerp(BTypography? other, double t) {
    if (other is! BTypography) {
      return this;
    }
    return BTypography(
      text72: TextStyle.lerp(text72, other.text72, t),
      text60: TextStyle.lerp(text60, other.text60, t),
      text48: TextStyle.lerp(text48, other.text48, t),
      text36: TextStyle.lerp(text36, other.text36, t),
      text30: TextStyle.lerp(text30, other.text30, t),
      text24: TextStyle.lerp(text24, other.text24, t),
      text20: TextStyle.lerp(text20, other.text20, t),
      text18: TextStyle.lerp(text18, other.text18, t),
      text16: TextStyle.lerp(text16, other.text16, t),
      text14: TextStyle.lerp(text14, other.text14, t),
      text12: TextStyle.lerp(text12, other.text12, t),
    );
  }
}

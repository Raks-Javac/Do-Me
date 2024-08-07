import 'package:flutter/material.dart';

@immutable
class BPallete extends ThemeExtension<BPallete> {
  const BPallete({
    required this.greyFCFD,
    required this.greyFAFB,
    required this.greyEBEC,
    required this.greyC7,
    required this.greyA2,
    required this.grey7D,
    required this.grey58,
    required this.grey45,
    required this.grey2C,
    required this.grey12,
    required this.grey000,
    required this.greenE6,
    required this.greenB3,
    required this.green80,
    required this.green4E,
    required this.green1B,
    required this.green02,
    required this.green00,
    required this.green0C,
    required this.green44,
    required this.green2A,
    required this.green11,
    required this.red1B,
    required this.error36,
    required this.textColor,
    required this.backgroundColor,
    required this.primaryColor,
    required this.tabBackgroundColor,
  });

  final Color? textColor;
  final Color? primaryColor;
  final Color? backgroundColor;
  final Color? greyFCFD;
  final Color? greyFAFB;
  final Color? greyEBEC;
  final Color? greyC7;
  final Color? greyA2;
  final Color? grey7D;
  final Color? grey58;
  final Color? grey45;
  final Color? grey2C;
  final Color? grey12;
  final Color? grey000;
  final Color? greenE6;
  final Color? greenB3;
  final Color? green80;
  final Color? green4E;
  final Color? green1B;
  final Color? green02;
  final Color? green00;
  final Color? green0C;
  final Color? green44;
  final Color? green2A;
  final Color? green11;
  final Color? red1B;
  final Color? error36;
  final Color? tabBackgroundColor;

  @override
  BPallete copyWith({
    Color? textColor,
    Color? primaryColor,
    Color? backgroundColor,
    Color? tabBackgroundColor,
    Color? greyFCFD,
    Color? greyFAFB,
    Color? greyEBEC,
    Color? greyC7,
    Color? greyA2,
    Color? grey7D,
    Color? grey58,
    Color? grey45,
    Color? grey2C,
    Color? grey12,
    Color? grey000,
    Color? greenE6,
    Color? greenB3,
    Color? green80,
    Color? green4E,
    Color? green1B,
    Color? green02,
    Color? green00,
    Color? green0C,
    Color? green44,
    Color? green2A,
    Color? green11,
    Color? red1B,
    Color? error36,
  }) {
    return BPallete(
      textColor: textColor ?? this.textColor,
      primaryColor: primaryColor ?? this.primaryColor,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      tabBackgroundColor: tabBackgroundColor ?? this.tabBackgroundColor,
      error36: error36 ?? this.error36,
      red1B: red1B ?? this.red1B,
      greyFCFD: greyFCFD ?? this.greyFCFD,
      greyFAFB: greyFAFB ?? this.greyFAFB,
      greyEBEC: greyEBEC ?? this.greyEBEC,
      greyC7: greyC7 ?? this.greyC7,
      greyA2: greyA2 ?? this.greyA2,
      grey7D: grey7D ?? this.grey7D,
      grey58: grey58 ?? this.grey58,
      grey45: grey45 ?? this.grey45,
      grey2C: grey2C ?? this.grey2C,
      grey12: grey12 ?? this.grey12,
      grey000: grey000 ?? this.grey000,
      greenE6: greenE6 ?? this.greenE6,
      greenB3: greenB3 ?? this.greenB3,
      green80: green80 ?? this.green80,
      green4E: green4E ?? this.green4E,
      green1B: green1B ?? this.green1B,
      green02: green02 ?? this.green02,
      green00: green00 ?? this.green00,
      green0C: green0C ?? this.green0C,
      green44: green44 ?? this.green44,
      green2A: green2A ?? this.green2A,
      green11: green11 ?? this.green11,
    );
  }

  @override
  BPallete lerp(BPallete? other, double t) {
    if (other is! BPallete) {
      return this;
    }
    return BPallete(
      textColor: Color.lerp(textColor, other.textColor, t),
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t),
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t),
      tabBackgroundColor: Color.lerp(tabBackgroundColor, other.tabBackgroundColor, t),
      error36: Color.lerp(error36, other.error36, t),
      red1B: Color.lerp(red1B, other.red1B, t),
      greyFCFD: Color.lerp(greyFCFD, other.greyFCFD, t),
      greyFAFB: Color.lerp(greyFAFB, other.greyFAFB, t),
      greyEBEC: Color.lerp(greyEBEC, other.greyEBEC, t),
      greyC7: Color.lerp(greyC7, other.greyC7, t),
      greyA2: Color.lerp(greyA2, other.greyA2, t),
      grey7D: Color.lerp(grey7D, other.grey7D, t),
      grey58: Color.lerp(grey58, other.grey58, t),
      grey45: Color.lerp(grey45, other.grey45, t),
      grey2C: Color.lerp(grey2C, other.grey2C, t),
      grey12: Color.lerp(grey12, other.grey12, t),
      grey000: Color.lerp(grey000, other.grey000, t),
      greenE6: Color.lerp(greenE6, other.greenE6, t),
      greenB3: Color.lerp(greenB3, other.greenB3, t),
      green80: Color.lerp(green80, other.green80, t),
      green4E: Color.lerp(green4E, other.green4E, t),
      green1B: Color.lerp(green1B, other.green1B, t),
      green02: Color.lerp(green02, other.green02, t),
      green00: Color.lerp(green00, other.green00, t),
      green0C: Color.lerp(green0C, other.green0C, t),
      green44: Color.lerp(green44, other.green44, t),
      green2A: Color.lerp(green2A, other.green2A, t),
      green11: Color.lerp(green11, other.green11, t),
    );
  }
}

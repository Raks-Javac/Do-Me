import 'package:dome/res/colors.dart';
import 'package:dome/res/strings.dart';
import 'package:dome/res/text_styles.dart';
import 'package:dome/res/theme/app_palette.dart';
import 'package:dome/res/theme/app_typography.dart';
import 'package:flutter/material.dart';

class BThemes {
  // Orange Theme
  static ThemeData get light {
    return ThemeData(
      primaryColor: BColors.primaryColor,
      primaryColorDark: BColors.primaryColor,
      primaryColorLight: BColors.primaryColor,
      primarySwatch: BColors.colorCustom,
      scaffoldBackgroundColor: BColors.white,
      brightness: Brightness.light,
      splashColor: BColors.primaryColor.withOpacity(0.3),
      fontFamily: BStrings.codecPro,
      extensions: <ThemeExtension<dynamic>>[
        const BPallete(
          backgroundColor: BColors.white,
          primaryColor: BColors.primaryColor,
          tabBackgroundColor: BColors.tabBackgroundColor,
          textColor: BColors.black,
          error36: BColors.error36,
          red1B: BColors.red1B,
          greyFCFD: BColors.greyFCFD,
          greyFAFB: BColors.greyFAFB,
          greyEBEC: BColors.greyEBEC,
          greyC7: BColors.greyC7,
          grey58: BColors.grey58,
          greyA2: BColors.greyA2,
          grey2C: BColors.grey2C,
          grey45: BColors.grey45,
          grey7D: BColors.grey7D,
          grey12: BColors.grey12,
          greenE6: BColors.greenE6,
          greenB3: BColors.greenB3,
          grey000: BColors.grey000,
          green80: BColors.green80,
          green00: BColors.green00,
          green1B: BColors.green1B,
          green0C: BColors.green0C,
          green44: BColors.green44,
          green4E: BColors.green4E,
          green2A: BColors.green2A,
          green02: BColors.green02,
          green11: BColors.green11,
        ),
        BTypography(
          text72: BTextStyle.text72,
          text60: BTextStyle.text60,
          text48: BTextStyle.text48,
          text36: BTextStyle.text36,
          text30: BTextStyle.text30,
          text24: BTextStyle.text24,
          text20: BTextStyle.text20,
          text18: BTextStyle.text18,
          text16: BTextStyle.text16,
          text14: BTextStyle.text14,
          text12: BTextStyle.text12,
        ),
      ],
    );
  }

  // Red Theme
  static ThemeData get dark {
    return ThemeData(
      primaryColor: BColors.primaryColor,
      primaryColorDark: BColors.primaryColor,
      primaryColorLight: BColors.primaryColor,
      primarySwatch: BColors.colorCustom,
      splashColor: BColors.primaryColor.withOpacity(0.3),
      fontFamily: BStrings.codecPro,
      scaffoldBackgroundColor: BColors.black,
      brightness: Brightness.dark,
      extensions: <ThemeExtension<dynamic>>[
        const BPallete(
          backgroundColor: BColors.white,
          primaryColor: BColors.primaryColor,
          tabBackgroundColor: BColors.tabBackgroundColor,
          textColor: BColors.black,
          error36: BColors.error36,
          red1B: BColors.red1B,
          greyFCFD: BColors.greyFCFD,
          greyFAFB: BColors.greyFAFB,
          greyEBEC: BColors.greyEBEC,
          greyC7: BColors.greyC7,
          grey58: BColors.grey58,
          greyA2: BColors.greyA2,
          grey2C: BColors.grey2C,
          grey45: BColors.grey45,
          grey7D: BColors.grey7D,
          grey12: BColors.grey12,
          greenE6: BColors.greenE6,
          greenB3: BColors.greenB3,
          grey000: BColors.grey000,
          green80: BColors.green80,
          green00: BColors.green00,
          green1B: BColors.green1B,
          green0C: BColors.green0C,
          green44: BColors.green44,
          green4E: BColors.green4E,
          green2A: BColors.green2A,
          green02: BColors.green02,
          green11: BColors.green11,
        ),
        BTypography(
          text72: BTextStyle.text72,
          text60: BTextStyle.text60,
          text48: BTextStyle.text48,
          text36: BTextStyle.text36,
          text30: BTextStyle.text30,
          text24: BTextStyle.text24,
          text20: BTextStyle.text20,
          text18: BTextStyle.text18,
          text16: BTextStyle.text16,
          text14: BTextStyle.text14,
          text12: BTextStyle.text12,
        ),
      ],
    );
  }
}

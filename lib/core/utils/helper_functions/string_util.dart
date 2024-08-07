import 'package:dome/core/utils/helper_functions/logger.dart';
import 'package:flutter/foundation.dart';

class StringUtils {
  static String makeFirstCaseCapital(String text) {
    if (text.trim().isEmpty) return text;
    StringBuffer sb = StringBuffer();
    List parts = text.split(" ");
    for (String s in parts) {
      s = s.trim();
      if (s.isEmpty) continue;
      if (s.length == 1) {
        sb.write("$s ");
        continue;
      }
      sb.write(s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase());
      sb.write(" ");
    }
    return sb.toString().trim();
  }

  static String formatAmount(dynamic text, {int decimal = 0}) {
    if (text == null) return "0.00";
    text = text.toString();
    if (text.toString().trim().isEmpty) return "0.00";
    text = text.replaceAll(",", "");
    try {
      text = double.parse(text).toStringAsFixed(decimal);
    } catch (e) {
      if (kDebugMode) {
        Logger.logError(e);
      }
    }
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String mathFunc(Match match) => '${match[1]},';

    return text.replaceAllMapped(reg, mathFunc);
  }

  static String hideDigits(
      String number, int visibleStartChar, int visibleEndChar) {
    int length = number.length;
    if (length <= visibleStartChar + visibleEndChar) return number;

    final prefix = number.substring(0, visibleStartChar);
    final suffix = number.substring(length - visibleEndChar);

    int asterisksCount = length - (prefix.length + suffix.length);
    return "$prefix${"*" * asterisksCount}$suffix";
  }

  static bool isEmpty(String? s) {
    return s == null || s.trim().isEmpty;
  }

  static bool isNotEmpty(String? s) {
    return s != null && s.trim().isNotEmpty;
  }

  static bool hasUpperCase(String password) {
    return RegExp('(?:[A-Z])').hasMatch(password);
  }

  static bool hasLowerCase(String password) {
    return RegExp('(?:[a-z])').hasMatch(password);
  }

  static bool hasSymbol(String password) {
    return RegExp(r"[!@#$%^&*(),\|+=;.?':{}|<>]").hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp('(?=.*?[0-9])').hasMatch(password);
  }

  static bool isValidEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  String getInitials(String name) {
    List<String> names = name.split(" ");
    String initials = "";

    if (names.isNotEmpty) {
      String firstNameInitial = names.first.isNotEmpty ? names.first[0] : '';
      if (names.length > 1) {
        String lastNameInitial = names.last.isNotEmpty ? names.last[0] : '';

        initials = firstNameInitial + lastNameInitial;
      } else {
        initials = firstNameInitial;
      }
    } else {
      initials = "";
    }

    return initials;
  }

  //

  static String? removeAfterComma(String? input) {
    if (input == null) {
      return 'Select Address'; // Return an empty string if the input is null
    }

    // Count commas while ignoring those within parentheses
    int commaCount = 0;
    bool withinParentheses = false;
    for (int i = 0; i < input.length; i++) {
      if (input[i] == '(') {
        withinParentheses = true;
      } else if (input[i] == ')') {
        withinParentheses = false;
      } else if (input[i] == ',' && !withinParentheses) {
        commaCount++;
      }
    }

    // If there is more than one comma, remove everything after the second comma
    if (commaCount > 1) {
      int secondCommaIndex = input.indexOf(',', input.indexOf(',') + 1);
      if (secondCommaIndex != -1) {
        input = input.substring(0, secondCommaIndex);
      }
    }

    // Check if the input string is longer than 30 words
    List<String> words = input.split('');
    if (words.length > 30) {
      input = words.sublist(0, 30).join(''); // Remove everything after 30 words
    }

    // Remove trailing comma and replace with a period
    if (input.isNotEmpty && input.endsWith(',')) {
      input = '${input.substring(0, input.length - 1)}.';
    }

    return input; // Return modified input or input if no comma found
  }

  //

  static int nairaToKobo(String value) {
    try {
      double amount = double.parse(value);
      // Convert Naira to Kobo (multiply by 100)
      return (amount * 100).toInt();
    } catch (e) {
      throw const FormatException('Invalid format');
    }
  }

  //
  String maskEmail(String email) {
    // Split the email into parts
    int atIndex = email.indexOf('@');
    if (atIndex <= 1) {
      return email; // If there's no valid character to mask, return the email as is
    }

    // Masking the part before @
    String maskedPart = '${email[0]}***';

    // Concatenate masked part with the rest of the email
    String maskedEmail = maskedPart + email.substring(atIndex);

    return maskedEmail;
  }
}

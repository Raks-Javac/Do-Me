import 'dart:developer';

import 'package:dome/core/utils/helper_functions/string_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Validator {
  static String? validateEmail(String? s) {
    if (StringUtils.isEmpty(s)) {
      return "Email cannot be empty";
    } else if (!StringUtils.isValidEmail(s!)) {
      return "Email must be a valid email address";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? s, {bool isLogin = false}) {
    if (s == null || s.isEmpty) {
      return "Password cannot be empty";
    }

    if (!isLogin) {
      if (s.trim().length < 8) {
        return "Password length must be at least 8 characters";
      }

      if (!s.contains(RegExp(r'[A-Z]'))) {
        return "Password must contain at least one uppercase letter";
      }

      if (!s.contains(RegExp(r'[a-z]'))) {
        return "Password must contain at least one lowercase letter";
      }

      if (!s.contains(RegExp(r'[0-9]'))) {
        return "Password must contain at least one number";
      }
    }

    return null;
  }

  static String? validateUsername(String? s) {
    if (StringUtils.isEmpty(s)) {
      return "Username cannot be empty";
    }
    //else if (s!.length < 6) {
    //   return "Username length must be six";
    // }
    else {
      return null;
    }
  }

  static String? validateOTP(String? s) {
    if (StringUtils.isEmpty(s)) {
      return "OTP cannot be empty";
    } else if (s!.length < 6) {
      return "OTP length must be six digit";
    } else {
      return null;
    }
  }

  static String getFormattedTimeDate(DateTime date) {
    var formatter = DateFormat('dd MMM yyyy - hh:mm:ss');

    final dateFormatted = formatter.format(date);

    return dateFormatted;
  }

  static String getPostFormattedDate(String date,
      [bool isWithoutTime = false]) {
    try {
      DateTime formattedDate = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(date);

      var formatter = isWithoutTime
          ? DateFormat('dd-MMM-yyyy')
          : DateFormat('dd-MMM-yyyy HH:mm:ss');

      final resultDate = formatter.format(formattedDate);

      return resultDate;
    } catch (e) {
      return date;
    }
  }

  static String getFormattedTime(String date) {
    try {
      DateTime formattedDate = DateTime.parse(date);

      String formattedTime = DateFormat.jm().format(formattedDate);

      return formattedTime;
    } catch (e) {
      return date;
    }
  }

  String formatCurrencyMoney(String value, {dynamic symbol}) {
    return value
        .replaceAll(",", "")
        .replaceAll("N", "")
        .replaceAll("\$", "")
        .replaceAll("\u{00A3}", "")
        .replaceAll("\u{20AC}", "")
        .replaceAll(symbol.toString(), "");
  }

  static int getFormattedAmount(String amount) {
    final amt =
        amount.replaceAll(RegExp(r'N\s|\,|\.00|NGN|USD|GBP|EUR|\s+'), "");

    return int.parse(amt);
  }

  static String removeCurrencySymbol(String amount) {
    final amt = amount.replaceAll(RegExp(r'N\s|NGN|USD|GBP|EUR|\s+|\,'), "");

    return amt;
  }

  double getFormattedAmountDouble(String amount) {
    final amt = amount.replaceAll(RegExp(r'N\s|\,|NGN|USD|GBP|EUR|\s+'), "");

    return double.parse(amt);
  }

  static bool isPasswordLengthCompliant(String password) {
    return password.length >= GeneralLimits.passwordLength ? true : false;
  }

  static bool containsUpperCase(String password) {
    return password.contains(RegExp(r'[A-Z]')) ? true : false;
  }

  static bool containsSpecialCharater(String password) {
    return password.contains(RegExp(r'\W')) ? true : false;
  }

  static String? validateConfirmPassword(
      String newPassword, String confirmNewPassword) {
    if (confirmNewPassword.isEmpty) {
      return "Passwords cannot be empty";
    }

    if (confirmNewPassword.trim().length < GeneralLimits.passwordLength) {
      return "Password length must be greater than ${GeneralLimits.passwordLength} characters";
    }

    if (newPassword != confirmNewPassword) {
      return "Passwords do not match";
    }

    if (!confirmNewPassword.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain upper case";
    }
    return null;
  }

  static String? validateConfirm2Password(
      String newPassword, String confirmNewPassword) {
    // Check if the password is at least 5 characters long
    if (confirmNewPassword.length < 5) {
      return "Password should be at least 5 characters long.";
    }
    if (!confirmNewPassword.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain upper case";
    }
    if (confirmNewPassword.isEmpty) {
      return "Passwords cannot be empty";
    }
    if (newPassword == confirmNewPassword) {
      return "Old password cannot be same as new password";
    }

    // Check if the password is at least 8 characters long
    if (confirmNewPassword.length < 8) {
      return "Password should be at least 8 characters long.";
    }

    // Check if the password contains at least 1 uppercase and 1 lowercase letter
    if (!(confirmNewPassword.contains(RegExp(r'[A-Z]')) &&
        confirmNewPassword.contains(RegExp(r'[a-z]')))) {
      return "Password should contain at least 1 uppercase and 1 lowercase letter.";
    }

    // Check if the password contains at least 1 number
    if (!confirmNewPassword.contains(RegExp(r'[0-9]'))) {
      return "Password should contain at least 1 number.";
    }

    // Check if the password contains at least 1 special character
    if (!confirmNewPassword
        .contains(RegExp(r'[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]'))) {
      return "Password should contain at least 1 special character.";
    }

    // If all conditions are met, return null to indicate a valid password
    return null;
  }

  static String? checkNewPassword(String currentPassword, String newPassword) {
    if (newPassword.trim().isEmpty) {
      return "Passwords cannot be empty";
    }

    if (newPassword.trim() != currentPassword.trim()) {
      if (newPassword.length < GeneralLimits.passwordLength) {
        return "Password length must be ${GeneralLimits.passwordLength} characters";
      }

      if (!newPassword.contains(RegExp(r'[A-Z]'))) {
        return "Password must contain upper case";
      }
    }

    if (newPassword.trim() == currentPassword.trim()) {
      return "New password must be different";
    }

    return null;
  }

  static String removeCommaFromString(String amount) {
    String amountString = amount.replaceAll(',', '');

    return amountString;
  }

  static String checkUserInput(String inputName, String value, int minLength) {
    if (value.trim().isEmpty) {
      return '$inputName can not be empty';
    } else if (value.trim().length < minLength) {
      return '$inputName should be a minimum of $minLength characters';
    }

    return "";
  }

//  todo: Input Validators
  static bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;

  static String? validateName(String value) {
    if (value.trim().isEmpty) return 'Field is required.';

    final RegExp nameExp = RegExp(r'^[A-za-z. ]+$');

    if (!nameExp.hasMatch(value.trim())) {
      return 'Please enter only alphabetical characters.';
    }

    return null;
  }

  static String? validateNumber(String value) {
    if (value.trim().isEmpty) return 'Field is required.';

    final RegExp nameExp = RegExp(r'^[-0-9 ]+$');

    if (!nameExp.hasMatch(value.trim())) {
      return 'Please enter only numeric characters.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? value) {
    if (StringUtils.isEmpty(value)) return 'Phone number is required.';

    final RegExp nameExp = RegExp(r'^(?:[+0])?[0-9]{10}$');

    if (!nameExp.hasMatch(value!.trim())) {
      return 'Please enter correct phone number.';
    }

    if (value.trim().length != 11) {
      return 'Phone number must be 11 digits';
    } else {
      return null;
    }
  }

  static String? validateString(dynamic value) {
    if (value.toString().trim().isEmpty) {
      return 'Field is required.';
    } else {
      return null;
    }
  }

  static String? validateDebitCardNumber(String value) {
    if (value.trim().isEmpty) {
      return 'Card number is required.';
    } else {
      return null;
    }

    // final RegExp cardNumberExp = RegExp(r'^\d{16}$|^\d{18}$');

    // if (!cardNumberExp.hasMatch(value.trim())) {
    //   return 'Please enter a valid card number.';
    // } else {
    //   return null;
    // }
  }

  static String returnFormattedDebitCard(String input) {
    if (input.isEmpty) {
      return ''; // Return an empty string if input is empty
    }

    final cleanedInput =
        input.replaceAll(RegExp(r'\D'), ''); // Remove non-digit characters
    final inputLength = cleanedInput.length;

    if (inputLength == 16 || inputLength == 19) {
      // Determine the mask length based on the input length
      final maskLength = (inputLength == 16) ? 6 : 9;

      // Create the mask format with spaces after every 4 digits
      // ignore: unused_local_variable
      final mask = '${'*' * maskLength} **** **** ****';

      var result = '';

      for (var i = 0; i < inputLength; i++) {
        if (i < 6 || i >= inputLength - 4) {
          // Reveal the first 6 and last 4 digits
          result += cleanedInput[i];
        } else {
          // Mask the remaining digits
          result += '*';
        }

        if ((i + 1) % 4 == 0 && i < inputLength - 1) {
          // Add a space after every 4 digits (except at the end)
          result += ' ';
        }
      }

      return result;
    } else {
      return '';
    }
  }

  static String formatCardNumberWithSpace(String input) {
    // Remove existing spaces (if any) and format the string
    String formattedString = input.replaceAll(" ", "");
    StringBuffer result = StringBuffer();

    // Add a space after every 4 characters
    for (int i = 0; i < formattedString.length; i++) {
      result.write(formattedString[i]);
      if ((i + 1) % 4 == 0 && i + 1 != formattedString.length) {
        result.write(" ");
      }
    }

    return result.toString();
  }

  static String? validateCVV(String value) {
    if (value.trim().isEmpty) return 'CVV is required.';

    final RegExp cvvExp = RegExp(r'^\d{3}$');

    if (!cvvExp.hasMatch(value.trim())) {
      return 'Please enter a valid CVV.';
    } else {
      return null;
    }
  }

  static String? validateCardPIN(String value) {
    if (value.trim().isEmpty) return 'Card PIN is required.';

    final RegExp pinExp = RegExp(r'^\d{4}$');

    if (!pinExp.hasMatch(value.trim())) {
      return 'Please enter a valid 4-digit Card PIN.';
    } else {
      return null;
    }
  }

  static bool spinnerVaidation(
      BuildContext context, TextEditingController controller, String text) {
    if (controller.text.isEmpty || controller.text == "") {
      return false;
    } else {
      return true;
    }
  }

  static String? pinValidator(BuildContext context, String text) {
    int trimmedTextLength = text.trim().length;

    if (text.trim().isEmpty) return 'Field is required.';

    if (trimmedTextLength < 4 || trimmedTextLength > 4) {
      return "😔 Oops! Your PIN must be  4 digits";
    }

    return null;
  }

  static String? newPinValidator(
      BuildContext context, String currentPin, String newPin) {
    int trimmedTextLength = newPin.trim().length;

    if (newPin.trim().isEmpty) return 'Field is required.';

    if (trimmedTextLength < 4) {
      return "😔 Oops! Your PIN must be  4 digits";
    }

    if (currentPin.trim() == newPin.trim()) {
      return "new PIN must be different.";
    }

    return null;
  }

  static String? confirmNewPinValidator(
      BuildContext context, String confirmPin, String currentPin) {
    log("ref $confirmPin and $currentPin");

    int trimmedTextLength = confirmPin.trim().length;

    if (confirmPin.trim().isEmpty) return 'Field is required.';

    if (trimmedTextLength < 4) {
      return "😔 Oops! Your PIN must be  4 digits";
    }

    if (confirmPin.trim() != currentPin.trim()) {
      return "😔 Oops! The PINs you provided do not match.";
    }

    if (confirmPin.trim() == currentPin.trim()) {
      return null;
    }

    return null;
  }

  static String? accountNumber(String controller) {
    String trimmed = controller.trim();

    if (trimmed.length < 10) {
      return "Account number must be 10 digits";
    }

    if (trimmed.isEmpty) {
      return "Account number cannot be empty";
    }
    // check if trimmed contains only numbers
    if (!StringUtils.hasNumber(trimmed)) {
      return "Account number must be numbers";
    }

    if (!trimmed.startsWith("00")) {
      return "Please enter a valid sterling account number";
    }

    return null;
  }

  static String? walletAccountNumber(String controller) {
    String trimmed = controller.trim();

    if (trimmed.length < 11) {
      return "Wallet Account number must be 11 digits";
    }

    if (trimmed.isEmpty) {
      return "Wallet Account number cannot be empty";
    }
    // check if trimmed contains only numbers
    if (!StringUtils.hasNumber(trimmed)) {
      return "Account number must be numbers";
    }

    if (!trimmed.startsWith("0")) {
      return "Please enter a valid sterling wallet account number";
    }

    return null;
  }

  String formatAmountNoSymbol(double? amount, [String? currency = '']) {
    var formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(amount);
  }

  static String formatAmountWithoutCurrency(
    double? amount,
  ) {
    var formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(amount);
  }

  static String formatAmountWithoutSymbol(
    double? amount,
  ) {
    var formatter = NumberFormat("#,##0.00", "en_US");
    var formattedValue = formatter.format(amount);
    return formattedValue.substring(0, formattedValue.length - 3);
  }

  static String getNairaSymbol(String? currency) {
    if (currency!.isNotEmpty && currency.contains("USD")) {
      return "\u{00024}";
    }
    if (currency.isNotEmpty && currency.contains("GBP")) {
      return "\u{00A3}";
    }
    if (currency.isNotEmpty && currency.contains("EUR")) {
      return "\u{20AC}";
    }
    if (currency.isEmpty || currency.contains("NGN")) {
      return "\u{20A6}";
    } else {
      return currency;
    }
  } //password strength logic

//contains at lesst 5 characters
  bool containsFive(String inputString) {
    return inputString.length >= 5;
  }

//contains at least 8 characters
  bool containsEight(String inputString) {
    return inputString.length >= 8;
  }

//contains both capitl and lowercase
  bool containsBothUppercaseAndLowercase(String inputString) {
    bool hasUppercase = false;
    bool hasLowercase = false;

    for (var char in inputString.runes) {
      if (isUppercase(char)) {
        hasUppercase = true;
      }
      if (isLowercase(char)) {
        hasLowercase = true;
      }
    }

    return hasUppercase && hasLowercase;
  }

  bool isUppercase(int charCode) {
    return charCode >= 65 &&
        charCode <= 90; // ASCII codes for uppercase letters
  }

  bool isLowercase(int charCode) {
    return charCode >= 97 &&
        charCode <= 122; // ASCII codes for lowercase letters
  }

//contains at least 1 number

  bool containsNumber(String inputString) {
    for (var char in inputString.runes) {
      if (isNumber(char)) {
        return true;
      }
    }
    return false;
  }

  bool isNumber(int charCode) {
    return charCode >= 48 && charCode <= 57; // ASCII codes for numerical digits
  }

//contains at least 1 special character

  bool containsSpecialCharacter(String inputString) {
    for (var char in inputString.runes) {
      if (isSpecialCharacter(char)) {
        return true;
      }
    }
    return false;
  }

  bool isSpecialCharacter(int charCode) {
    // ASCII codes for common special characters: 33-47, 58-64, 91-96, 123-126
    return (charCode >= 33 && charCode <= 47) ||
        (charCode >= 58 && charCode <= 64) ||
        (charCode >= 91 && charCode <= 96) ||
        (charCode >= 123 && charCode <= 126);
  }

  String getPasswordStrength(String password) {
    if (password.length >= 8) {
      if (containsNumber(password) &&
          containsUppercaseAndLowercase(password) &&
          containsSpecialCharacter(password)) {
        return "VERY STRONG";
      } else if (containsNumber(password) &&
          containsUppercaseAndLowercase(password)) {
        return "strong";
      } else if (containsUppercaseAndLowercase(password)) {
        return "medium";
      } else {
        return "weak";
      }
    } else if (password.length >= 5) {
      return "weak";
    } else {
      return "very weak";
    }
  }

  bool containsUppercaseAndLowercase(String inputString) {
    bool hasUppercase = false;
    bool hasLowercase = false;

    for (var char in inputString.runes) {
      if (isUppercase(char)) {
        hasUppercase = true;
      }
      if (isLowercase(char)) {
        hasLowercase = true;
      }

      if (hasUppercase && hasLowercase) {
        return true;
      }
    }

    return false;
  }

// //return color based on password strength

//   Color returnColorBasedOnStrength(String inputString) {
//     switch (inputString) {
//       case "WEAK":
//         return AppColors.sterlingYello1;
//       case "VERY WEAK":
//         return AppColors.sterlingRed;
//       case "MEDIUM":
//         return AppColors.sterlingRed;
//       case "STRONG":
//         return AppColors.sterlingBlue1;
//       case "VERY STRONG":
//         return AppColors.sterlingGreen1;

//       default:
//         return AppColors.sterlingRed;
//     }
//   }
}

class TextInputLimits {
  static const int usernameLength = 30;

  static const int emailLength = 50;

  static const int passwordLength = 25;

  static const int nameLength = 20;

  static const int phoneLength = 11;

  static const int bvnLength = 11;

  static const int securityQuestionAnswerLength = 11;

  static const int otpLength = 6;

  static const int amountLength = 7;

  static const int pinLength = 4;
}

class TextInputMinLimits {
  static const int nameLength = 3;

  static const int passwordLength = 5;
}

class GeneralLimits {
  static const int passwordLength = 8;
}

class Pay4MeConstants {
  static const int pay4MeEligibleAmount = 50000;
}

// String getProperDateFormatNew(
//     {required String date, bool isYearFirst = false}) {
//   Logger.logInfo("initial date: $date");

//   date = date.replaceAll("-", "-");
//   var endMonth = date.substring(3, 6);
//   Logger.logInfo("end month: $endMonth");

//   var endMonthFormatted = getMonthString(endMonth.toLowerCase());
//   var endDay = date.substring(0, 2);
//   Logger.logInfo("end day: $endDay");

//   var endYear = date.substring(7, 11);
//   Logger.logInfo("end year: $endYear");

//   var endDate = "$endMonthFormatted-$endDay-$endYear";
//   var endDate2 = "$endYear-$endMonthFormatted-$endDay";
//   return isYearFirst == true ? endDate2 : endDate;
// }

// String getMonthString(String value) {
//   switch (value) {
//     case MonthEnum.jan:
//       return "01";
//     case MonthEnum.feb:
//       return "02";
//     case MonthEnum.march:
//       return "03";
//     case MonthEnum.april:
//       return "04";
//     case MonthEnum.may:
//       return "05";
//     case MonthEnum.june:
//       return "06";
//     case MonthEnum.july:
//       return "07";
//     case MonthEnum.august:
//       return "08";
//     case MonthEnum.september:
//       return "09";
//     case MonthEnum.october:
//       return "10";
//     case MonthEnum.november:
//       return "11";
//     case MonthEnum.december:
//       return "12";
//     default:
//       return "01";
//   }
// }

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toSentenceCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

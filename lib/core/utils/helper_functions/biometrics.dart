// //We use multiple packages to access the native services like Camera, Photo Gallery, Location, etc for that we need to write code in a separate file which we can be used from multiple places throughout the application

// import 'package:billbunch/src/core/utils/helper_functions/logger.dart';
// import 'package:flutter/services.dart';
// import 'package:local_auth/local_auth.dart';

// class Biometrics {
//   static final LocalAuthentication auth = LocalAuthentication();
//   static bool _canCheckBiometrics = false, mounted = false;
//   static List<BiometricType> _availableBiometrics = [];
//   static String authorized = 'Not Authorized';
//   static const bool _isAuthenticating = false;

//   static Future<bool> doBiometrics() async {
//     await checkBiometrics();
//     await getAvailableBiometrics();

//     return _isAuthenticating
//         ? Biometrics.cancelAuthentication()
//         : Biometrics.authenticate();
//   }

//   static Future<bool> checkBiometrics() async {
//     bool canCheckBiometrics = false;
//     try {
//       canCheckBiometrics = await auth.canCheckBiometrics;
//     } on PlatformException catch (e) {
//       Logger.logInfo(e);
//     }
//     if (!mounted) return false;

//     _canCheckBiometrics = canCheckBiometrics;
//     return _canCheckBiometrics;
//   }

//   static Future<List<BiometricType>> getAvailableBiometrics() async {
//     List<BiometricType> availableBiometrics = [];
//     try {
//       availableBiometrics = await auth.getAvailableBiometrics();
//     } on PlatformException catch (e) {
//       Logger.logInfo(e);
//     }
//     if (!mounted) return availableBiometrics;

//     _availableBiometrics = availableBiometrics;
//     return _availableBiometrics;
//   }

//   static void openBiometricSettings() async {
//     // if (Platform.isAndroid) {
//     //   const String packageName = 'com.android.settings';
//     //   const String settingsPage = 'android.settings.SECURITY_SETTINGS';
//     //   if (await canLaunch('package:$packageName')) {
//     //     await launch('package:$packageName/$settingsPage');
//     //   } else {
//     //     // Handle the case where the app can't open the settings.
//     //   }
//     // }
//     // if (Platform.isIOS) {
//     //   const String settingsPage = 'App-Prefs:root=TOUCHID_PASSCODE';

//     //   if (await canLaunch(settingsPage)) {
//     //     await launch(settingsPage);
//     //   } else {
//     //     // Handle the case where the app can't open the settings.
//     //   }
//     // }
//   }

//   static Future<bool> authenticate(
//       {Function(String)? biometricsReturnMessage}) async {
//     bool authenticated = false;

//     authenticated = await auth.authenticate(
//       localizedReason: 'Scan to authorize',
//       options: const AuthenticationOptions(biometricOnly: true),
//     );
//     return authenticated;
//   }

//   static Future<bool> cancelAuthentication() {
//     return auth.stopAuthentication();
//   }
// }

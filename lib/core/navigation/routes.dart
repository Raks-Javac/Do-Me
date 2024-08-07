import 'dart:io';

import 'package:dome/features/onboarding/views/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String splashScreen = '/splashScreen';
  static const String onboardingScreen = '/onboarding';

  //checkout page

  static const String signUpView = "/step1";
  static const String registerStep2 = "/step2";

  //
  static const String successScreen = "/successScreen";

  final routes = {
    splashScreen: (context) => const SplashView(),
  };

  static Route getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return _getPageRoute(routeSettings, const SplashView());
      // case onboardingScreen:
      //   return _getPageRoute(routeSettings, const OnBoardingMainView());

      // case manageAccountView:
      //   return _getPageRoute(routeSettings, const ManageAccountView());
      // case successScreen:
      //   CompletedScreenArgs? args =
      //       routeSettings.arguments as CompletedScreenArgs;
      //   return _getPageRoute(
      //       routeSettings,
      //       CompletedScreen(
      //         args: args,
      //       ));
      // case dashboard:
      //   return _getPageRoute(routeSettings, const DashBoardView());
      // case notificationsView:
      //   return _getPageRoute(routeSettings, const NotificationsView());

      default:
        return _getPageRoute(
          routeSettings,
          const SplashView(),
        );
    }
  }

  static Route _getPageRoute(
    RouteSettings routeSettings,
    Widget screen, {
    bool isFullScreen = false,
  }) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        settings: routeSettings,
        builder: (context) => screen,
        fullscreenDialog: isFullScreen,
      );
    }
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) => screen,
      fullscreenDialog: isFullScreen,
    );
  }
}

import 'package:dome/app_locator.dart';
import 'package:dome/core/navigation/navigator_key.dart';
import 'package:dome/core/navigation/routes.dart';
import 'package:dome/res/strings.dart';
import 'package:dome/res/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'package:provider/provider.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await ScreenUtil.ensureScreenSize();
  await setUpLocator();

  runApp(const DomeApp());
}

class DomeApp extends StatelessWidget {
  const DomeApp({super.key});
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return InAppNotification(
      child: MultiProvider(
        providers: providers,
        builder: (context, child) {
          return ScreenUtilInit(
            designSize: const Size(430, 932),
            minTextAdapt: true,
            splitScreenMode: false,
            useInheritedMediaQuery: true,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaler: const TextScaler.linear(
                      1.0), // Change textScaler to textScaleFactor
                ),
                child: MaterialApp(
                  title: BStrings.appName,
                  theme: BThemes.primary,
                  debugShowCheckedModeBanner: false,
                  onGenerateRoute: AppRoute.getRoute,
                  navigatorKey: NavigatorKey.appNavigatorKey,
                  initialRoute: AppRoute.splashScreen,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

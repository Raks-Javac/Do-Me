import 'package:dome/app_locator.dart';
import 'package:dome/core/navigation/routes.dart';
import 'package:dome/res/assets.dart';
import 'package:dome/res/theme/app_palette.dart';
import 'package:dome/widgets/render_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    checkDbAndnavigateToOnboarding();
  }

  checkDbAndnavigateToOnboarding() async {
    final getStatus = await blocalDB.getOnBoardingStatus();
    // final getLoginInfo = await blocalDB.getloginInfoStatus();

    // if (getLoginInfo != null) {
    //   Logger.logInfo("Login info $getLoginInfo");
    //   loggedInUser = ApiUserModel.fromJson(getLoginInfo);
    // }

    Future.delayed(const Duration(seconds: 4), () async {
      appRouter.pushNamedAndRemoveUntil(
          // getStatus == true
          //     ? loggedInUser != null
          //         ? AppRoute.existingUserView
          //         : AppRoute.signInScreen
          //     :
          AppRoute.onboardingScreen,
          (predicte) => true);

      blocalDB.storeOnBoardingStatus(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorPallete = theme.extension<BPallete>();

    return Scaffold(
      backgroundColor: colorPallete?.grey45,
      body: Center(
        child: SizedBox(
          width: 250.sp,
          height: 150,
          child: const BWidgetsRenderAssetImage(
            isAsset: true,
            fit: BoxFit.contain,
            width: 100,
            height: 150,
            imagePath: inappLogo,
          ),
        ),
      ),
    );
  }
}

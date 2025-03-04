import 'package:flutter/material.dart';
import 'package:personal_income_expense/app/constant/app_asset.dart';
import 'package:personal_income_expense/app/helper/extension_helper.dart';
import 'package:personal_income_expense/app/utills/dimension.dart';
import 'package:personal_income_expense/app/widgets/app_background.dart';
import 'package:personal_income_expense/app/widgets/app_image_assets.dart';
import 'package:personal_income_expense/screen/splash/splash_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  SplashScreenHelper? splashScreenHelper;

  @override
  Widget build(BuildContext context) {
    'Current screen --> $runtimeType'.logs();
    splashScreenHelper ??= SplashScreenHelper(this);
    return const Scaffold(
      body: AppBackground(
        child: Center(child: AppImageAsset(image: AppAsset.appBackground, height: Dimens.heightHuge, width: Dimens.heightHuge)),
      ),
    );
  }
}

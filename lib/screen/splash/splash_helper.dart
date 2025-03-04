import 'dart:async';

import 'package:personal_income_expense/app/routes/route_helper.dart';
import 'package:personal_income_expense/screen/splash/splash_screen.dart';

class SplashScreenHelper {
  SplashScreenState state;

  SplashScreenHelper(this.state) {
    manageUser();
  }

  Future<void> manageUser() async {
    Future.delayed(const Duration(seconds: 2), () => RouteHelper.instance.goToTransaction());
  }
}

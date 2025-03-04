import 'package:get/get.dart';
import 'package:untitled/screen/finance_module/month_screen/month_screen.dart';
import 'package:untitled/screen/finance_module/transaction_screen/transaction_screen.dart';
import 'package:untitled/screen/splash/splash_screen.dart';

class RouteConstant {
  static const String initial = '/';
  static const String onBoarding = '/onBoarding';
  static const String transaction = '/transaction';
  static const String summary = '/summary';
}

class GetPageRouteHelper {
  static List<GetPage> routes = [
    GetPage(name: RouteConstant.initial, page: () => const SplashScreen()),
    GetPage(name: RouteConstant.onBoarding, page: () => const MonthScreen()),
    GetPage(name: RouteConstant.transaction, page: () => const TransactionScreen()),
    GetPage(name: RouteConstant.summary, page: () => const SummaryScreen()),
  ];
}

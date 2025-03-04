import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/helper/extension_helper.dart';
import 'package:untitled/app/widgets/app_background.dart';
import 'package:untitled/controller/onboarding_controller.dart';
import 'package:untitled/screen/summary_screen/summary_screen_helper.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => SummaryScreenState();
}

class SummaryScreenState extends State<SummaryScreen> {
  SummaryScreenHelper? monthScreenHelper;
  FinanceController? financeController;

  @override
  Widget build(BuildContext context) {
    'Current screen --> $runtimeType'.logs();
    monthScreenHelper ??= SummaryScreenHelper(this);
    return GetBuilder(
      init: FinanceController(),
      builder: (FinanceController controller) {
        financeController = controller;
        return const Scaffold(
          body: AppBackground(
            child: Center(

            ),
          ),
        );
      },
    );
  }
}

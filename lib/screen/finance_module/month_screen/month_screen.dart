import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_income_expense/app/constant/color_constant.dart';
import 'package:personal_income_expense/app/helper/extension_helper.dart';
import 'package:personal_income_expense/app/widgets/app_background.dart';
import 'package:personal_income_expense/app/widgets/app_text.dart';
import 'package:personal_income_expense/controller/onboarding_controller.dart';
import 'package:personal_income_expense/screen/finance_module/month_screen/month_screen_helper.dart';

class MonthScreen extends StatefulWidget {
  const MonthScreen({super.key});

  @override
  State<MonthScreen> createState() => MonthScreenState();
}

class MonthScreenState extends State<MonthScreen> {
  MonthScreenHelper? monthScreenHelper;
  FinanceController? financeController;

  @override
  Widget build(BuildContext context) {
    'Current screen --> $runtimeType'.logs();
    monthScreenHelper ??= MonthScreenHelper(this);
    return GetBuilder(
      init: FinanceController(),
      builder: (FinanceController controller) {
        financeController = controller;
        return Scaffold(
          body: AppBackground(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 120, mainAxisSpacing: 16, crossAxisSpacing: 16,),
              itemCount: monthScreenHelper?.months.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => monthScreenHelper?.updateSelectedMonth(monthScreenHelper?.months[index] ?? ''),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColorConstant.appLightPurple,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: AppColorConstant.appBoxShadow,
                    ),
                    child: Center(
                      child: AppText(
                        monthScreenHelper?.months[index] ?? '',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

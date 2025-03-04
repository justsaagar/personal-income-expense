import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:untitled/app/constant/color_constant.dart';
import 'package:untitled/app/helper/extension_helper.dart';
import 'package:untitled/app/utills/date_utils.dart';
import 'package:untitled/app/utills/dimension.dart';
import 'package:untitled/app/widgets/app_background.dart';
import 'package:untitled/app/widgets/app_button.dart';
import 'package:untitled/app/widgets/app_text.dart';
import 'package:untitled/app/widgets/app_text_form_field.dart';
import 'package:untitled/controller/onboarding_controller.dart';
import 'package:untitled/screen/finance_module/transaction_screen/transaction_screen_helper.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => TransactionScreenState();
}

class TransactionScreenState extends State<TransactionScreen> {
  TransactionScreenHelper? monthScreenHelper;
  FinanceController? financeController;

  @override
  Widget build(BuildContext context) {
    'Current screen --> $runtimeType'.logs();
    monthScreenHelper ??= TransactionScreenHelper(this);
    return GetBuilder(
      init: FinanceController(),
      builder: (FinanceController controller) {
        financeController = controller;
        return Scaffold(
          body: AppBackground(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  const AppText('Date', fontWeight: FontWeight.w800, fontSize: 18),
                  InkWell(
                    onTap: () => financeController?.selectBirthDate(context),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(DimensPadding.paddingMedium),
                      decoration: BoxDecoration(
                        color: AppColorConstant.appWhite,
                        borderRadius: BorderRadius.circular(Dimens.borderRadiusMedium),
                        border: Border.all(color: AppColorConstant.appTransparent, width: 2),
                      ),
                      child: AppText(
                        DateTimeUtils.getFormattedBirthDate(financeController?.selectedDate.toLocal()),
                        textAlign: TextAlign.center,
                        color: AppColorConstant.appBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const AppText('Amount', fontWeight: FontWeight.w800, fontSize: 18),
                  AppTextFormField(
                    controller: financeController?.amountEditingController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                  const SizedBox(height: 22),
                  const AppText('Description', fontWeight: FontWeight.w800, fontSize: 18),
                  AppTextFormField(
                    isMaxLines: true,
                    keyboardType: TextInputType.multiline,
                    controller: financeController?.descEditingController,
                  ),
                  const SizedBox(height: 22),
                  AppButton(title: 'Submit', onTap: () => financeController?.submitTransaction()),
                  const SizedBox(height: 22),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

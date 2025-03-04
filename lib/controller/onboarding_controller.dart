import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/app/constant/app_asset.dart';
import 'package:untitled/app/constant/color_constant.dart';
import 'package:untitled/app/helper/extension_helper.dart';
import 'package:untitled/app/routes/route_helper.dart';
import 'package:untitled/app/utills/date_utils.dart';
import 'package:untitled/main.dart';
import 'package:untitled/repository/utills/utills_repository.dart';
import 'package:untitled/serialized/transaction_model.dart';

class FinanceController extends GetxController {
  UtillsRepository utillsRepository = getIt.get<UtillsRepository>();
  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  bool isIncome = false;
  String? selectedMonth;
  DateTime selectedDate = DateTime.now();
  final TextEditingController amountEditingController = TextEditingController();
  final TextEditingController descEditingController = TextEditingController();

  void updateSelectedMonth(String month) => selectedMonth = month;

  Future<void> selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: selectedDate,
      helpText: 'Selected Date',
      confirmText: 'Okay',
      cancelText: 'Cancel',
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: AppColorConstant.appWhite,
            colorScheme: const ColorScheme.light(primary: AppColorConstant.appLightPurple),
            fontFamily: AppAsset.defaultFont,
            dialogTheme: DialogTheme(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      selectedDate = picked;
      update();
    }
  }

  Future<void> submitTransaction() async {
    final TransactionModel transactionModel = TransactionModel(
      transactionId: DateTime.now().microsecondsSinceEpoch.toString(),
      amount: num.parse(amountEditingController.text),
      date: DateTimeUtils.getFormattedBirthDate(selectedDate),
      description: descEditingController.text,
      month: months[selectedDate.month - 1],
      isIncome: isIncome,
    );
    'TransactionModel --> ${transactionModel.toJson()}'.logs();
    await utillsRepository.addTransactionData(transactionModel);
    RouteHelper.instance.goToOnBoarding();
  }

  void manageType(bool value) {
    isIncome = value;
    update();
  }
}

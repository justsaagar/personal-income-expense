import 'package:untitled/screen/finance_module/transaction_screen/transaction_screen.dart';

class TransactionScreenHelper {
  TransactionScreenState state;

  TransactionScreenHelper(this.state);

  void updateState() => state.financeController?.update();

  void updateSelectedMonth(String month) {
    state.financeController?.updateSelectedMonth(month);
    updateState();
  }
}

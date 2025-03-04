import 'package:untitled/app/routes/route_helper.dart';
import 'package:untitled/screen/finance_module/month_screen/month_screen.dart';

class MonthScreenHelper {
  MonthScreenState state;
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

  MonthScreenHelper(this.state);

  void updateState() => state.financeController?.update();

  void updateSelectedMonth(String month) {
    state.financeController?.updateSelectedMonth(month);
    updateState();
    RouteHelper.instance.goToTransaction();
  }
}

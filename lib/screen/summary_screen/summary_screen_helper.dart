import 'package:untitled/screen/summary_screen/summary_screen.dart';

class SummaryScreenHelper {
  SummaryScreenState state;

  SummaryScreenHelper(this.state);

  void updateState() => state.financeController?.update();
}

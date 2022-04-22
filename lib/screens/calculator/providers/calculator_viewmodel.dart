import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_river_calc/models/calculator.dart';
import 'package:my_river_calc/repository/calculator_api.dart';
import 'package:my_river_calc/utils/calculator_operator.dart';
import 'package:my_river_calc/utils/calculator_state_completion.dart';

class CalculatorViewModel extends StateNotifier<Calculator> {
  final CalculatorApi _calcApi;

  CalculatorViewModel({required CalculatorApi calculatorApi})
      : _calcApi = calculatorApi,
        super(Calculator(0, CalculatorOperator.none, '0',
            CalculatorStateCompletion.progress));

  void onSetOperator(CalculatorOperator opr) async {
    try {
      clear();
      if (opr == CalculatorOperator.equal &&
          state.operator != CalculatorOperator.none) {
        final num2 = int.parse(state.display);
        final calcResult = await _calcApi.calculatorComputation(
            state.num!, num2, state.operator);
        if (calcResult != null) {
          state = state.copyWith(
              num: 0,
              display: calcResult.toString(),
              operator: CalculatorOperator.none,
              completeState: CalculatorStateCompletion.complete);
        }
      } else if (opr != CalculatorOperator.equal &&
          state.operator == CalculatorOperator.none) {
        final num1 = int.parse(state.display);
        state = state.copyWith(
            num: num1,
            display: '0',
            operator: opr,
            completeState: CalculatorStateCompletion.progress);
      } else {}
    } catch (e) {
      state = state.copyWith(
          num: 0,
          display: '0',
          operator: CalculatorOperator.none,
          completeState: CalculatorStateCompletion.failed);
    }
  }

  void clear() {
    if (state.completeState == CalculatorStateCompletion.complete ||
        state.completeState == CalculatorStateCompletion.failed) {
      state = state.copyWith(
          num: 0,
          operator: CalculatorOperator.none,
          display: '0',
          completeState: CalculatorStateCompletion.progress);
    }
  }

  void onSetNum(String numTitle) {
    clear();
    if (state.display == '0') {
      state = state.copyWith(display: numTitle);
    } else {
      state = state.copyWith(display: state.display + numTitle);
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_river_calc/models/calculator.dart';
import 'package:my_river_calc/utils/calculator_operator.dart';

class CalculatorViewModel extends StateNotifier<Calculator> {
  final Ref ref;

  CalculatorViewModel(this.ref) : super(Calculator(0, CalculatorOperator.none, '0', false));

  void onSetOperator(CalculatorOperator opr) {
    if (opr == CalculatorOperator.equal) {
      final num2 = int.parse(state.display);
      String result = '0';
      switch (state.operator) {
        case CalculatorOperator.plus:
          result = (state.num! + num2).toString();
          break;
        case CalculatorOperator.minus:
          result = (state.num! - num2).toString();
          break;
        default:
          result = state.display;
      }
      state = state.copyWith(display: result, operator: CalculatorOperator.none, isComplete: true);
    } else {
      if (state.operator == CalculatorOperator.none) {
        final num1 = int.parse(state.display);
        state = state.copyWith(num: num1, display: '0', operator: opr);
      }
    }
  }

  void onSetNum(String numTitle) {
    if (state.isComplete) {
      state =
          state.copyWith(num: 0, operator: CalculatorOperator.none, display: '0', isComplete: false);
    }
    if (state.display == '0') {
      state = state.copyWith(display: numTitle);
    } else {
      state = state.copyWith(display: state.display + numTitle);
    }
  }
}

import 'package:my_river_calc/utils/calculator_operator.dart';
import 'package:my_river_calc/utils/calculator_state_completion.dart';

class Calculator {
  final int? num;
  final CalculatorOperator operator;
  final String display;
  final CalculatorStateCompletion completeState;

  Calculator(this.num, this.operator, this.display,this.completeState);

  Calculator copyWith({int? num, CalculatorOperator? operator, String? display,CalculatorStateCompletion? completeState}) {
    return Calculator(
        num ?? this.num, operator ?? this.operator, display ?? this.display, completeState ?? this.completeState);
  }

  @override
  String toString() {
    return 'num: $num, operator: $operator, display: $display, completeState: $completeState';
  }
}

import 'package:my_river_calc/utils/calculator_operator.dart';

class Calculator {
  final int? num;
  final CalculatorOperator operator;
  final String display;
  final bool isComplete;

  Calculator(this.num, this.operator, this.display,this.isComplete);

  Calculator copyWith({int? num, CalculatorOperator? operator, String? display,bool? isComplete}) {
    return Calculator(
        num ?? this.num, operator ?? this.operator, display ?? this.display, isComplete ?? this.isComplete);
  }

  @override
  String toString() {
    return 'num: $num, operator: $operator, display: $display, isComplete: $isComplete';
  }
}

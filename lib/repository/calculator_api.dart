import 'package:my_river_calc/utils/calculator_operator.dart';

abstract class CalculatorApi {
  Future<int?> calculatorComputation(int num1, int num2, CalculatorOperator operator);
}

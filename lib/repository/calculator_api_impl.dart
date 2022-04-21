import 'package:my_river_calc/repository/calculator_api.dart';
import 'package:my_river_calc/utils/calculator_operator.dart';

class CalculatorApiImpl implements CalculatorApi {
  @override
  Future<int?> calculatorComputation(
      int num1, int num2, CalculatorOperator operator) {
    switch (operator) {
      case CalculatorOperator.plus:
        // throw Exception('errors');
        return Future.value(num1 + num2);
      case CalculatorOperator.minus:
        return Future.value(num1 - num2);
      case CalculatorOperator.none:
        throw Exception('None Operator');
      case CalculatorOperator.equal:
        throw Exception('Equal Operator');
      default:
        throw Exception('Unsupported Operator');
    }
  }
}

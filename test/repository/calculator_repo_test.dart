import 'package:flutter_test/flutter_test.dart';
import 'package:my_river_calc/repository/calculator_api_impl.dart';
import 'package:my_river_calc/utils/calculator_operator.dart';

main() {
  group('Calculator Repository', () {
    test('Plus Computation should return correctly', () async {
      final res = await CalculatorApiImpl()
          .calculatorComputation(1, 2, CalculatorOperator.plus);
      expect(res, 3);
    });
    test('Minus Computation should return correctly', () async {
      final res = await CalculatorApiImpl()
          .calculatorComputation(1, 2, CalculatorOperator.minus);
      expect(res, -1);
    });
    test('None operator should throw error', () async {
      expect(
          () async => await CalculatorApiImpl()
              .calculatorComputation(1, 2, CalculatorOperator.none),
          throwsException);
    });
    test('Equal operator should throw error', () async {
      expect(
              () async => await CalculatorApiImpl()
              .calculatorComputation(1, 2, CalculatorOperator.equal),
          throwsException);
    });
  });
}

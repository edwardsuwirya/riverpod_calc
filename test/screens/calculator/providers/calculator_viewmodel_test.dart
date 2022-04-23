import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:my_river_calc/repository/calculator_api.dart';
import 'package:my_river_calc/repository/calculator_api_impl.dart';
import 'package:my_river_calc/screens/calculator/providers/calculator_provider.dart';
import 'package:my_river_calc/utils/calculator_operator.dart';
import 'package:my_river_calc/utils/calculator_state_completion.dart';

import 'calculator_viewmodel_test.mocks.dart';

@GenerateMocks([CalculatorApiImpl])
main() {
  group('Calculator Repository', () {
    late CalculatorApi mockCalcApi = MockCalculatorApiImpl();
    test('On Set Operator equal should return result correctly', () async{
      final container = ProviderContainer(
        overrides: [
          calculatorApiRepoProvider.overrideWithValue(mockCalcApi)
        ]
      );
      addTearDown(container.dispose);
      when(mockCalcApi.calculatorComputation(1, 10, CalculatorOperator.plus))
          .thenAnswer((_) async => 11);
      final calcVm = container.read(calculatorViewModelProvider.notifier);
      calcVm.state = calcVm.state.copyWith(num: 1,display: '10',completeState: CalculatorStateCompletion.progress,operator:  CalculatorOperator.plus);
      calcVm.onSetOperator(CalculatorOperator.equal);
      await untilCalled(mockCalcApi.calculatorComputation(1, 10, CalculatorOperator.plus));
      expect(calcVm.state.display, '11');
      expect(calcVm.state.completeState, CalculatorStateCompletion.complete);
    });
    test('On Set Operator when repo throw error', () async{
      final container = ProviderContainer(
          overrides: [
            calculatorApiRepoProvider.overrideWithValue(mockCalcApi)
          ]
      );
      addTearDown(container.dispose);
      when(mockCalcApi.calculatorComputation(1, 10, CalculatorOperator.plus))
          .thenThrow(Exception('Error'));
      final calcVm = container.read(calculatorViewModelProvider.notifier);
      calcVm.state = calcVm.state.copyWith(num: 1,display: '10',completeState: CalculatorStateCompletion.progress,operator:  CalculatorOperator.plus);
      calcVm.onSetOperator(CalculatorOperator.equal);
      expect(calcVm.state.display, '0');
      expect(calcVm.state.completeState, CalculatorStateCompletion.failed);
    });

    test('On Set Number should return correctly', () {
      final container = ProviderContainer(
          overrides: [
            calculatorApiRepoProvider.overrideWithValue(mockCalcApi)
          ]
      );
      addTearDown(container.dispose);
      final calcVm = container.read(calculatorViewModelProvider.notifier);
      calcVm.onSetNum('1');
      expect(calcVm.state.display, '1');
      calcVm.onSetNum('2');
      expect(calcVm.state.display, '12');
    });

    test('On clear', () {
      final container = ProviderContainer(
          overrides: [
            calculatorApiRepoProvider.overrideWithValue(mockCalcApi)
          ]
      );
      addTearDown(container.dispose);
      final calcVm = container.read(calculatorViewModelProvider.notifier);
      calcVm.clear();
      expect(calcVm.state.display, '0');
    });
  });
}

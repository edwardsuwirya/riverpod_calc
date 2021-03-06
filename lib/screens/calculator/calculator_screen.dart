import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_river_calc/models/calculator.dart';
import 'package:my_river_calc/screens/calculator/common_widgets/calc_button.dart';
import 'package:my_river_calc/screens/calculator/common_widgets/calc_display.dart';
import 'package:my_river_calc/screens/calculator/providers/calculator_provider.dart';
import 'package:my_river_calc/utils/calculator_state_completion.dart';

class CalcScreen extends ConsumerWidget {
  const CalcScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<Calculator>(calculatorViewModelProvider, (previous, next) {
      if (next.completeState == CalculatorStateCompletion.failed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ooops...something is wrong')),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CalcDisplay(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CalcButton(numberTitle: '9'),
                  CalcButton(numberTitle: '6'),
                  CalcButton(numberTitle: '3'),
                  const SizedBox(height: 48),
                ],
              ),
              Column(
                children: [
                  CalcButton(numberTitle: '8'),
                  CalcButton(numberTitle: '5'),
                  CalcButton(numberTitle: '2'),
                  CalcButton(numberTitle: '0'),
                ],
              ),
              Column(
                children: [
                  CalcButton(numberTitle: '7'),
                  CalcButton(numberTitle: '4'),
                  CalcButton(numberTitle: '1'),
                  const SizedBox(height: 48),
                ],
              ),
              Column(
                children: [
                  CalcButton(
                    numberTitle: '+',
                    isOperator: true,
                  ),
                  CalcButton(
                    numberTitle: '-',
                    isOperator: true,
                  ),
                  CalcButton(
                    numberTitle: '=',
                    isOperator: true,
                  ),
                  const SizedBox(height: 48),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

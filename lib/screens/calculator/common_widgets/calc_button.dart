import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_river_calc/screens/calculator/providers/calculator_provider.dart';
import 'package:my_river_calc/utils/calculator_operator.dart';

class CalcButton extends ConsumerWidget {
  final String numberTitle;
  final bool isOperator;

  CalcButton({Key? key, required this.numberTitle, this.isOperator = false})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(calculatorViewModelProvider.notifier);
    return ElevatedButton(
        onPressed: () {
          if (isOperator) {
            controller.onSetOperator(CalcOprToEnum(numberTitle));
          } else {
            controller.onSetNum(numberTitle);
          }
        },
        child: Text(
          numberTitle,
          style: const TextStyle(fontSize: 24),
        ));
  }
}

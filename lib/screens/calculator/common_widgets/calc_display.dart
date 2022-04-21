import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_river_calc/screens/calculator/providers/calculator_provider.dart';

class CalcDisplay extends ConsumerWidget {
  CalcDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calc = ref.watch(calculatorViewModelProvider);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Text(
        calc.display,
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}

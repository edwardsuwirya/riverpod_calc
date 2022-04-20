import 'package:flutter/material.dart';
import 'package:my_river_calc/screens/common_widgets/calc_button.dart';
import 'package:my_river_calc/screens/common_widgets/calc_display.dart';

class CalcScreen extends StatelessWidget {
  const CalcScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CalcDisplay(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CalcButton(numberTitle: '9'),
                  CalcButton(numberTitle: '8'),
                  CalcButton(numberTitle: '7'),
                  const SizedBox(height: 48),
                ],
              ),
              Column(
                children: [
                  CalcButton(numberTitle: '6'),
                  CalcButton(numberTitle: '5'),
                  CalcButton(numberTitle: '4'),
                  CalcButton(numberTitle: '0'),
                ],
              ),
              Column(
                children: [
                  CalcButton(numberTitle: '3'),
                  CalcButton(numberTitle: '2'),
                  CalcButton(numberTitle: '1'),
                  const SizedBox(height: 48),
                ],
              ),
              Column(
                children: [
                  CalcButton(numberTitle: '+'),
                  CalcButton(numberTitle: '-'),
                  CalcButton(numberTitle: '='),
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

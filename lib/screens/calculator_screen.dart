import 'package:flutter/material.dart';
import 'package:my_river_calc/screens/common_widgets/calc_button.dart';
import 'package:my_river_calc/screens/common_widgets/calc_display.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({Key? key}) : super(key: key);

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  int num1 = 0;
  int num2 = 0;
  String operator = '';
  String _displayTitle = '0';

  void setDisplayTitle(String sNumber) {
    setState(() {
      if (operator == '=') {
        clearState();
      }
      if (_displayTitle == '0') {
        _displayTitle = sNumber;
      } else {
        _displayTitle = _displayTitle + sNumber;
      }
    });
  }

  void clearState() {
    num1 = 0;
    num2 = 0;
    operator = '';
    _displayTitle = '0';
  }

  void setToNum(String operator) {
    setState(() {
      if (operator == '=') {
        num2 = int.parse(_displayTitle);
        switch (this.operator) {
          case '+':
            _displayTitle = (num1 + num2).toString();
            break;
          case '-':
            _displayTitle = (num1 - num2).toString();
            break;
        }
        this.operator = operator;
      } else {
        this.operator = operator;
        num1 = int.parse(_displayTitle);
        _displayTitle = '0';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CalcDisplay(
            display: _displayTitle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CalcButton(
                      numberTitle: '9', buttonCalcCallback: setDisplayTitle),
                  CalcButton(
                      numberTitle: '6', buttonCalcCallback: setDisplayTitle),
                  CalcButton(
                      numberTitle: '3', buttonCalcCallback: setDisplayTitle),
                  const SizedBox(height: 48),
                ],
              ),
              Column(
                children: [
                  CalcButton(
                      numberTitle: '8', buttonCalcCallback: setDisplayTitle),
                  CalcButton(
                      numberTitle: '5', buttonCalcCallback: setDisplayTitle),
                  CalcButton(
                      numberTitle: '2', buttonCalcCallback: setDisplayTitle),
                  CalcButton(
                      numberTitle: '0', buttonCalcCallback: setDisplayTitle),
                ],
              ),
              Column(
                children: [
                  CalcButton(
                      numberTitle: '7', buttonCalcCallback: setDisplayTitle),
                  CalcButton(
                      numberTitle: '4', buttonCalcCallback: setDisplayTitle),
                  CalcButton(
                      numberTitle: '1', buttonCalcCallback: setDisplayTitle),
                  const SizedBox(height: 48),
                ],
              ),
              Column(
                children: [
                  CalcButton(
                    numberTitle: '+',
                    buttonCalcCallback: setToNum,
                  ),
                  CalcButton(numberTitle: '-', buttonCalcCallback: setToNum),
                  CalcButton(numberTitle: '=', buttonCalcCallback: setToNum),
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

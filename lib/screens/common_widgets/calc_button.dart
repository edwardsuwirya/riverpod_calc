import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String numberTitle;
  final Function buttonCalcCallback;

  CalcButton(
      {Key? key, required this.numberTitle, required this.buttonCalcCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          buttonCalcCallback(numberTitle);
        },
        child: Text(
          numberTitle,
          style: const TextStyle(fontSize: 24),
        ));
  }
}

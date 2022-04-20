import 'package:flutter/material.dart';

class CalcDisplay extends StatelessWidget {
  const CalcDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: const Text(
        '0',
        textAlign: TextAlign.right,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

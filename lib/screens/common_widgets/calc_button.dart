import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String numberTitle;

  CalcButton({Key? key, required this.numberTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text(
          numberTitle,
          style: const TextStyle(fontSize: 24),
        ));
  }
}

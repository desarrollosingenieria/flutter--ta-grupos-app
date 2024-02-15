import 'package:flutter/material.dart';
import 'package:tagrupo/src/views/pages/homePage/widgets/custom_button.dart';

class Button3Group extends StatelessWidget {
  final String keyA, keyB, keyC;
  const Button3Group(
      {super.key, required this.keyA, required this.keyB, required this.keyC});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(letter: keyA),
        SizedBox(
          width: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.01
              : MediaQuery.of(context).size.height * 0.01,
        ),
        CustomButton(letter: keyB),
        SizedBox(
          width: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.01
              : MediaQuery.of(context).size.height * 0.01,
        ),
        CustomButton(letter: keyC),
      ],
    );
  }
}


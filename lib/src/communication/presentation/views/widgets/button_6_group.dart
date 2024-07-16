import 'package:flutter/material.dart';
import 'package:tagrupos/src/communication/presentation/views/widgets/custom_button.dart';

class Button6Group extends StatelessWidget {
  final String keyA, keyB, keyC, keyD, keyE, keyF;
  const Button6Group(
      {super.key,
      required this.keyA,
      required this.keyB,
      required this.keyC,
      required this.keyD,
      required this.keyE,
      required this.keyF});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(letter: keyA,),
            SizedBox(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.01
                  : MediaQuery.of(context).size.height * 0.01,
            ),
            CustomButton(letter: keyB,),
            SizedBox(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.01
                  : MediaQuery.of(context).size.height * 0.01,
            ),
            CustomButton(letter: keyC,),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.01
              : MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          children: [
            CustomButton(letter: keyD,),
            SizedBox(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.01
                  : MediaQuery.of(context).size.height * 0.01,
            ),
            CustomButton(letter: keyE,),
            SizedBox(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.01
                  : MediaQuery.of(context).size.height * 0.01,
            ),
            CustomButton(letter: keyF,),
          ],
        )
      ],
    );
  }
}

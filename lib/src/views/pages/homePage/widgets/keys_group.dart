import 'package:flutter/material.dart';
import 'package:tagrupo/src/views/pages/homePage/widgets/button_3_group.dart';
import 'package:tagrupo/src/views/pages/homePage/widgets/button_6_group.dart';
import 'package:tagrupo/src/views/pages/homePage/widgets/space_button.dart';

class KeysGroup extends StatelessWidget {
  const KeysGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Button6Group(
              keyA: 'A',
              keyB: 'B',
              keyC: 'C',
              keyD: 'D',
              keyE: 'E',
              keyF: 'F',
            ),
            Button6Group(
              keyA: 'G',
              keyB: 'H',
              keyC: 'I',
              keyD: 'J',
              keyE: 'K',
              keyF: 'L',
            ),
          ],
        ),
        const SpaceButton(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Button6Group(
              keyA: 'M',
              keyB: 'N',
              keyC: 'Ñ',
              keyD: 'P',
              keyE: 'Q',
              keyF: 'O',
            ),
            Button6Group(
              keyA: 'R',
              keyB: 'S',
              keyC: 'T',
              keyD: 'U',
              keyE: 'V',
              keyF: 'W',
            ),
          ],
        ),
        MediaQuery.of(context).orientation == Orientation.portrait 
        ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Button3Group(
              keyA: 'X',
              keyB: 'Y',
              keyC: 'Z',
            ),
            SizedBox(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.02
                  : MediaQuery.of(context).size.height * 0.05,
            ),
            const Button3Group(
              keyA: ',',
              keyB: '.',
              keyC: '?',
            ),
          ],
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Button3Group(
              keyA: 'X',
              keyB: 'Y',
              keyC: 'Z',
            ),
            SizedBox(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.02
                  : MediaQuery.of(context).size.height * 0.05,
            ),
            const Button3Group(
              keyA: ',',
              keyB: '.',
              keyC: '?',
            ),
          ],
        ) 
      ],
    );
  }
}

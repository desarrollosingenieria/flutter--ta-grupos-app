import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tecgrupo/src/provider/config_provider.dart';
import 'package:tecgrupo/src/provider/tts_provider.dart';

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
    final configProvider = Provider.of<ConfigProvider>(context);
    final ttsProvider = Provider.of<TTSProvider>(context, listen: false);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black12,
              child: InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                  ttsProvider.setText(keyA);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.14
                          : MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.14,
                  alignment: Alignment.center,
                  child: Text(
                    keyA.toUpperCase(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              0.68 *
                              configProvider.factorSize!
                          : MediaQuery.of(context).size.height *
                              0.68 *
                              configProvider.factorSize!,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.01
                  : MediaQuery.of(context).size.height * 0.01,
            ),
            Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black12,
              child: InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                  ttsProvider.setText(keyB);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.14
                          : MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.14,
                  alignment: Alignment.center,
                  child: Text(
                    keyB.toUpperCase(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              0.68 *
                              configProvider.factorSize!
                          : MediaQuery.of(context).size.height *
                              0.68 *
                              configProvider.factorSize!,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.01
                  : MediaQuery.of(context).size.height * 0.01,
            ),
            Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black12,
              child: InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                  ttsProvider.setText(keyC);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.14
                          : MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.14,
                  alignment: Alignment.center,
                  child: Text(
                    keyC.toUpperCase(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              0.68 *
                              configProvider.factorSize!
                          : MediaQuery.of(context).size.height *
                              0.68 *
                              configProvider.factorSize!,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.01
              : MediaQuery.of(context).size.height * 0.01,
        ),
        Row(
          children: [
            Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black12,
              child: InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                  ttsProvider.setText(keyD);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.14
                          : MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.14,
                  alignment: Alignment.center,
                  child: Text(
                    keyD.toUpperCase(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              0.68 *
                              configProvider.factorSize!
                          : MediaQuery.of(context).size.height *
                              0.68 *
                              configProvider.factorSize!,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.01
                  : MediaQuery.of(context).size.height * 0.01,
            ),
            Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black12,
              child: InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                  ttsProvider.setText(keyE);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.14
                          : MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.14,
                  alignment: Alignment.center,
                  child: Text(
                    keyE.toUpperCase(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              0.68 *
                              configProvider.factorSize!
                          : MediaQuery.of(context).size.height *
                              0.68 *
                              configProvider.factorSize!,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.01
                  : MediaQuery.of(context).size.height * 0.01,
            ),
            Material(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black12,
              child: InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                  ttsProvider.setText(keyF);
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.14
                          : MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.14,
                  alignment: Alignment.center,
                  child: Text(
                    keyF.toUpperCase(),
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              0.68 *
                              configProvider.factorSize!
                          : MediaQuery.of(context).size.height *
                              0.68 *
                              configProvider.factorSize!,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

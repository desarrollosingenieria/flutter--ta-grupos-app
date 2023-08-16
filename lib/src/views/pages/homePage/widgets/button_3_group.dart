import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tecgrupo/src/provider/config_provider.dart';
import 'package:tecgrupo/src/provider/tts_provider.dart';

class Button3Group extends StatelessWidget {
  final String keyA, keyB, keyC;
  const Button3Group(
      {super.key, required this.keyA, required this.keyB, required this.keyC});

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);
    final ttsProvider = Provider.of<TTSProvider>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
              width: MediaQuery.of(context).size.width * 0.14,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.14
                  : MediaQuery.of(context).size.height * 0.10,
              alignment: Alignment.center,
              child: Text(
                keyA.toUpperCase(),
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
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
              width: MediaQuery.of(context).size.width * 0.14,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.14
                  : MediaQuery.of(context).size.height * 0.10,
              alignment: Alignment.center,
              child: Text(
                keyB.toUpperCase(),
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
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
              width: MediaQuery.of(context).size.width * 0.14,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.14
                  : MediaQuery.of(context).size.height * 0.10,
              alignment: Alignment.center,
              child: Text(
                keyC.toUpperCase(),
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
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
    );
  }
}

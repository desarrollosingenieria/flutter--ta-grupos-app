import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tecgrupo/src/data/local/user_preferences.dart';
import 'package:tecgrupo/src/provider/config_provider.dart';
import 'package:tecgrupo/src/provider/tts_provider.dart';
import 'package:tecgrupo/src/utils/keys_check.dart';

class Button3Group extends StatelessWidget {
  final String keyA, keyB, keyC;
  const Button3Group(
      {super.key, required this.keyA, required this.keyB, required this.keyC});

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);
    final ttsProvider = Provider.of<TTSProvider>(context, listen: false);
    final prefs = UserPreferences();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          borderRadius: BorderRadius.circular(16),
          color: prefs.highlightFont
              ? isAConsonantOrVowel(key: keyA) == 'consonant'
                  ? Colors.orange
                  : isAConsonantOrVowel(key: keyA) == 'vowel'
                      ? const Color(0xFF003A70)
                      : Colors.black12
              : Colors.black12,
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
                              configProvider.factorSize!
                          : MediaQuery.of(context).size.height *
                              configProvider.factorSize!,
                  fontWeight: FontWeight.bold,
                  color: prefs.highlightFont &&
                          isAConsonantOrVowel(key: keyA) != 'other'
                      ? Colors.white
                      : const Color(0xFF003A70),
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
          color: prefs.highlightFont
              ? isAConsonantOrVowel(key: keyB) == 'consonant'
                  ? Colors.orange
                  : isAConsonantOrVowel(key: keyB) == 'vowel'
                      ? const Color(0xFF003A70)
                      : Colors.black12
              : Colors.black12,
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
                              configProvider.factorSize!
                          : MediaQuery.of(context).size.height *
                              configProvider.factorSize!,
                  fontWeight: FontWeight.bold,
                  color: prefs.highlightFont &&
                          isAConsonantOrVowel(key: keyB) != 'other'
                      ? Colors.white
                      : const Color(0xFF003A70),
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
          color: prefs.highlightFont
              ? isAConsonantOrVowel(key: keyC) == 'consonant'
                  ? Colors.orange
                  : isAConsonantOrVowel(key: keyC) == 'vowel'
                      ? const Color(0xFF003A70)
                      : Colors.black12
              : Colors.black12,
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
                              configProvider.factorSize!
                          : MediaQuery.of(context).size.height *
                              configProvider.factorSize!,
                  fontWeight: FontWeight.bold,
                  color: prefs.highlightFont &&
                          isAConsonantOrVowel(key: keyC) != 'other'
                      ? Colors.white
                      : const Color(0xFF003A70),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

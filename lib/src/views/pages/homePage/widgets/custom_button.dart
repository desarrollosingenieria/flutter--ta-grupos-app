import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tagrupo/src/data/local/user_preferences.dart';
import 'package:tagrupo/src/provider/config_provider.dart';
import 'package:tagrupo/src/provider/tts_provider.dart';
import 'package:tagrupo/src/utils/keys_check.dart';

class CustomButton extends StatelessWidget {
  final String letter;
  const CustomButton({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);
    final ttsProvider = Provider.of<TTSProvider>(context, listen: false);
    final prefs = UserPreferences();
    return Material(
          borderRadius: BorderRadius.circular(16),
          color: prefs.highlightFont
              ? isAConsonantOrVowel(key: letter) == 'consonant'
                  ? prefs.highContrast ? Colors.yellow : Colors.orange
                  : isAConsonantOrVowel(key: letter) == 'vowel'
                      ? prefs.highContrast ? Colors.purple : const Color(0xFF003A70)
                      : prefs.highContrast ? Colors.white : Colors.black12
              : prefs.highContrast ? isAConsonantOrVowel(key: letter) == 'other' ? Colors.white : Colors.yellow : Colors.black12,
          child: InkWell(
            onTap: () {
              HapticFeedback.lightImpact();
              ttsProvider.setText(letter);
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.14,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.14
                  : MediaQuery.of(context).size.height * 0.10,
              alignment: Alignment.center,
              child: Text(
                letter.toUpperCase(),
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              configProvider.factorSize!
                          : MediaQuery.of(context).size.height *
                              configProvider.factorSize!,
                  fontWeight: FontWeight.bold,
                  color: prefs.highlightFont &&
                          isAConsonantOrVowel(key: letter) != 'other'
                      ? prefs.highContrast ? Colors.black : Colors.white
                      : prefs.highContrast ? Colors.black : const Color(0xFF003A70),
                ),
              ),
            ),
          ),
        );
  }
}
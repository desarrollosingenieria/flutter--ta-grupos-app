import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tagrupos/core/constants/constants.dart';
import 'package:tagrupos/core/utils/utils.dart';
import 'package:tagrupos/src/communication/presentation/providers/voice_controller.dart';
import 'package:tagrupos/src/customisation/presentation/providers/customisation_controller.dart';

class CustomButton extends ConsumerWidget {
  final String letter;
  const CustomButton({super.key, required this.letter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: 
      appParameters.keyboardStyle == HIGHLIGHT_KEYBOARD_STYLE
          ? isAConsonantOrVowel(key: letter) == 'consonant'
              ? appParameters.highContrast
                  ? Colors.yellow
                  : Colors.orange
              : isAConsonantOrVowel(key: letter) == 'vowel'
                  ? appParameters.highContrast
                      ? Colors.purple
                      : const Color(0xFF003A70)
                  : appParameters.highContrast
                      ? Colors.white
                      : Colors.black12
          : appParameters.highContrast
              ? isAConsonantOrVowel(key: letter) == 'other'
                  ? Colors.white
                  : Colors.yellow
              : Colors.black12,
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          ref.read(voiceControllerProvider.notifier).setText(text: letter);
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
              MediaQuery.of(context).orientation ==
                      Orientation.portrait
                  ? MediaQuery.of(context).size.width * appParameters.factorSize
                  : MediaQuery.of(context).size.height * appParameters.factorSize,
              fontWeight: FontWeight.bold,
              color: 
              appParameters.keyboardStyle == HIGHLIGHT_KEYBOARD_STYLE &&
                      isAConsonantOrVowel(key: letter) != 'other'
                  ? appParameters.highContrast
                      ? Colors.black
                      : Colors.white
                  : appParameters.highContrast
                      ? Colors.black
                      : const Color(0xFF003A70),
            ),
          ),
        ),
      ),
    );
  }
}

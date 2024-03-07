import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tagrupo/src/data/local/user_preferences.dart';
import 'package:tagrupo/src/provider/config_provider.dart';
import 'package:tagrupo/src/provider/tts_provider.dart';

class ButtonsActionWidget extends ConsumerWidget {
  const ButtonsActionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = UserPreferences();
    final appConfig = ref.watch(configProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          borderRadius: BorderRadius.circular(16),
          color: prefs.highContrast ? Colors.white : Colors.blue,
          child: InkWell(
            onTap: () {
              HapticFeedback.lightImpact();
              ref.read(appTTSProvider.notifier).speak(appConfig.ttsText!);
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.3
                  : MediaQuery.of(context).size.width * 0.14,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.1
                  : MediaQuery.of(context).size.height * 0.10,
              alignment: Alignment.center,
              child: Text(
                'Decir'.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              0.68 *
                              appConfig.factorSize
                          : MediaQuery.of(context).size.height *
                              0.68 *
                              appConfig.factorSize,
                  fontWeight: FontWeight.bold,
                  color: prefs.highContrast ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.02
              : MediaQuery.of(context).size.height * 0.02,
        ),
        Material(
          borderRadius: BorderRadius.circular(16),
          color: prefs.highContrast ? Colors.purple : Colors.redAccent,
          child: InkWell(
            onTap: () {
              HapticFeedback.lightImpact();
              ref.read(configProvider.notifier).deleteLast();
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.1
                  : MediaQuery.of(context).size.height * 0.10,
              alignment: Alignment.center,
              child: Icon(
                Icons.backspace,
                color: Colors.white,
                size: MediaQuery.of(context).orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.width * 0.06
                    : MediaQuery.of(context).size.height * 0.06,
              ),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.02
              : MediaQuery.of(context).size.height * 0.02,
        ),
        Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: () {
              HapticFeedback.lightImpact();
              ref.read(configProvider.notifier).deleteAllText();
            },
            borderRadius: BorderRadius.circular(16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      width: 4,
                      color: prefs.highContrast
                          ? Colors.white
                          : Colors.redAccent)),
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * 0.1
                  : MediaQuery.of(context).size.height * 0.10,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: prefs.highContrast ? Colors.white : Colors.redAccent,
                    size: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.06
                        : MediaQuery.of(context).size.height * 0.06,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

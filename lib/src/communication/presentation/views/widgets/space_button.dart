import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tagrupos/core/constants/constants.dart';
import 'package:tagrupos/src/communication/presentation/providers/voice_controller.dart';
import 'package:tagrupos/src/customisation/presentation/providers/customisation_controller.dart';

class SpaceButton extends ConsumerWidget {
  const SpaceButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appParameters = ref.watch(customisationControllerProvider);
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: appParameters.highContrast ? Colors.white : Colors.black12,
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          ref.read(voiceControllerProvider.notifier).setText(text: SPACE_TEXT);
        },
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? MediaQuery.of(context).size.width * 0.14
              : MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.5,
          alignment: Alignment.center,
          child: Text(
            SPACE_TEXT,
            style: TextStyle(
              fontSize: MediaQuery.of(context).orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.width *
                          0.68 *
                          appParameters.factorSize
                      : MediaQuery.of(context).size.height *
                          0.68 *
                          appParameters.factorSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

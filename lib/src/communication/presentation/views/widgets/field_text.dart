import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tagrupos/core/constants/constants.dart';
import 'package:tagrupos/src/communication/presentation/providers/voice_controller.dart';
import 'package:tagrupos/src/customisation/presentation/providers/customisation_controller.dart';

class FieldTextWidget extends ConsumerWidget {
  const FieldTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController textController = TextEditingController();
    final appParameters = ref.watch(customisationControllerProvider);
    final voiceParameters = ref.watch(voiceControllerProvider);
    textController.text = voiceParameters.text;
    textController.selection = TextSelection(
        baseOffset: textController.text.length,
        extentOffset: textController.text.length);

    return TextField(
      onTap: () {},
      readOnly: true,
      showCursor: true,
      controller: textController,
      style: TextStyle(
        fontSize: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.width * 1 * appParameters.factorSize
            : MediaQuery.of(context).size.height *
                1 *
                appParameters.factorSize,
        fontWeight: FontWeight.bold,
        color: appParameters.highContrast ? Colors.white : Colors.black,
      ),
      onChanged: (newText) {
        textController.selection = TextSelection(
            baseOffset: newText.length, extentOffset: newText.length);
      },
      maxLines: 1,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(
                color: appParameters.highContrast ? Colors.white : Colors.black,
                width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(
                color: appParameters.highContrast ? Colors.white : Colors.black,
                width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(
                color: appParameters.highContrast ? Colors.white : Colors.black,
                width: 2),
          ),
          hintText: FIELD_TEXT_HINT,
          hintStyle: TextStyle(
            color: appParameters.highContrast ? Colors.white : Colors.black,
          )),
    );
  }
}

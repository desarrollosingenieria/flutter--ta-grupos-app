import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tagrupo/src/data/local/user_preferences.dart';
import 'package:tagrupo/src/provider/config_provider.dart';

class FieldTextWidget extends ConsumerWidget {
  const FieldTextWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController textController = TextEditingController();
    final appConfig = ref.watch(configProvider);
    textController.text = appConfig.ttsText ?? '';
    textController.selection = TextSelection(
        baseOffset: textController.text.length,
        extentOffset: textController.text.length);
    final prefs = UserPreferences();

    return TextField(
      onTap: () {},
      readOnly: true,
      showCursor: true,
      controller: textController,
      style: TextStyle(
        fontSize: MediaQuery.of(context).orientation == Orientation.portrait
            ? MediaQuery.of(context).size.width * 1 * appConfig.factorSize
            : MediaQuery.of(context).size.height *
                1 *
                appConfig.factorSize,
        fontWeight: FontWeight.bold,
        color: prefs.highContrast ? Colors.white : Colors.black,
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
                color: prefs.highContrast ? Colors.white : Colors.black,
                width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(
                color: prefs.highContrast ? Colors.white : Colors.black,
                width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            borderSide: BorderSide(
                color: prefs.highContrast ? Colors.white : Colors.black,
                width: 2),
          ),
          hintText: 'Escribe algo...',
          hintStyle: TextStyle(
            color: prefs.highContrast ? Colors.white : Colors.black,
          )),
    );
  }
}

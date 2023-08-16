import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tecgrupo/src/provider/config_provider.dart';
import 'package:tecgrupo/src/provider/tts_provider.dart';
import 'package:tecgrupo/src/utils/responsive.dart';

class FieldTextWidget extends StatefulWidget {
  const FieldTextWidget({super.key});

  @override
  State<FieldTextWidget> createState() => _FieldTextWidgetState();
}

class _FieldTextWidgetState extends State<FieldTextWidget> {
  TextEditingController textController = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    final ttsProvider = Provider.of<TTSProvider>(context);
    final configProvider = Provider.of<ConfigProvider>(context);
    textController.text = ttsProvider.textToSpeech;
    textController.selection = TextSelection(
        baseOffset: textController.text.length,
        extentOffset: textController.text.length);

    return Responsive.isLargeScreen(context)
        ? Row(
            children: [
              Expanded(
                child: TextField(
                  onTap: () {},
                  readOnly: true,
                  showCursor: true,
                  controller: textController,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width *
                            1 *
                            configProvider.factorSize!
                        : MediaQuery.of(context).size.height *
                            1 *
                            configProvider.factorSize!,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  onChanged: (newText) {
                    print(newText.length);
                    textController.selection = TextSelection(
                        baseOffset: newText.length,
                        extentOffset: newText.length);
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Escribe algo...'),
                ),
              ),
              SizedBox(
                width:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.02
                        : MediaQuery.of(context).size.height * 0.02,
              ),
              Material(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue,
                child: InkWell(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    ttsProvider.speak(text: ttsProvider.textToSpeech);
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.14,
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.06
                        : MediaQuery.of(context).size.height * 0.10,
                    alignment: Alignment.center,
                    child: Text(
                      'Decir'.toUpperCase(),
                      textAlign: TextAlign.center,
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
                width:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.02
                        : MediaQuery.of(context).size.height * 0.02,
              ),
              Material(
                borderRadius: BorderRadius.circular(16),
                color: Colors.redAccent,
                child: InkWell(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    ttsProvider.deleteLast();
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.06
                        : MediaQuery.of(context).size.height * 0.10,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.backspace,
                      color: Colors.white,
                      size: MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? MediaQuery.of(context).size.width * 0.06
                          : MediaQuery.of(context).size.height * 0.06,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.02
                        : MediaQuery.of(context).size.height * 0.02,
              ),
              Material(
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    ttsProvider.deleteAllText();
                  },
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(width: 4, color: Colors.redAccent)),
                    height: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.06
                        : MediaQuery.of(context).size.height * 0.10,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.redAccent,
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
          )
        : Column(
            children: [
              TextField(
                onTap: () {},
                readOnly: true,
                showCursor: true,
                controller: textController,
                style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width *
                              1 *
                              configProvider.factorSize!
                          : MediaQuery.of(context).size.height *
                              1 *
                              configProvider.factorSize!,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                onChanged: (newText) {
                  print(newText.length);
                  textController.selection = TextSelection(
                      baseOffset: newText.length, extentOffset: newText.length);
                },
                maxLines: 1,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Escribe algo...'),
              ),
              SizedBox(
                height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.01
                        : MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue,
                    child: InkWell(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        ttsProvider.speak(text: ttsProvider.textToSpeech);
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        width: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.width * 0.3
                            : MediaQuery.of(context).size.width * 0.14,
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.width * 0.1
                            : MediaQuery.of(context).size.height * 0.10,
                        alignment: Alignment.center,
                        child: Text(
                          'Decir'.toUpperCase(),
                          textAlign: TextAlign.center,
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
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.02
                        : MediaQuery.of(context).size.height * 0.02,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.redAccent,
                    child: InkWell(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        ttsProvider.deleteLast();
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.width * 0.1
                            : MediaQuery.of(context).size.height * 0.10,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.backspace,
                          color: Colors.white,
                          size: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? MediaQuery.of(context).size.width * 0.06
                              : MediaQuery.of(context).size.height * 0.06,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).orientation ==
                            Orientation.portrait
                        ? MediaQuery.of(context).size.width * 0.02
                        : MediaQuery.of(context).size.height * 0.02,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        ttsProvider.deleteAllText();
                      },
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border:
                                Border.all(width: 4, color: Colors.redAccent)),
                        height: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? MediaQuery.of(context).size.width * 0.1
                            : MediaQuery.of(context).size.height * 0.10,
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.redAccent,
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
              ),
            ],
          );
  }
}

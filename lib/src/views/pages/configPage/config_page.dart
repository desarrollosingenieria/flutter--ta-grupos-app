import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tagrupo/src/data/local/user_preferences.dart';
import 'package:tagrupo/src/provider/config_provider.dart';
import 'package:tagrupo/src/provider/tts_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfigPage extends ConsumerWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size mq = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    final UserPreferences prefs = UserPreferences();
    final appConfig = ref.watch(configProvider);
    return Scaffold(
      backgroundColor: prefs.highContrast ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text(
          'Configuraciones',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xFF003A70),
        centerTitle: true,
        elevation: 0,
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Volumen',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * appConfig.factorSize
                              : mq.height * appConfig.factorSize,
                          fontWeight: FontWeight.bold,
                          color: prefs.highContrast
                              ? Colors.white
                              : const Color(0xFF003A70),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          ref.read(configProvider.notifier).setVolume(-0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: appConfig.ttsVolume > 0.05
                                ? prefs.highContrast
                                    ? Colors.white
                                    : const Color(0xFF003A70)
                                : prefs.highContrast
                                    ? Colors.black
                                    : Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            color: prefs.highContrast
                                ? Colors.black
                                : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: orientation == Orientation.portrait
                            ? mq.width * 0.3
                            : mq.height * 0.3,
                        child: Text(
                          '${(appConfig.ttsVolume * 100).round()}',
                          style: TextStyle(
                            fontSize: orientation == Orientation.portrait
                                ? mq.width * appConfig.factorSize
                                : mq.height * appConfig.factorSize,
                            fontWeight: FontWeight.normal,
                            color: prefs.highContrast
                                ? Colors.white
                                : const Color(0xFF003A70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(configProvider.notifier).setVolume(0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: appConfig.ttsVolume < 1
                                ? prefs.highContrast
                                    ? Colors.white
                                    : const Color(0xFF003A70)
                                : prefs.highContrast
                                    ? Colors.black
                                    : Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            color: prefs.highContrast
                                ? Colors.black
                                : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? mq.width * 0.04
                      : mq.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Velocidad',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * appConfig.factorSize
                              : mq.height * appConfig.factorSize,
                          fontWeight: FontWeight.bold,
                          color: prefs.highContrast
                              ? Colors.white
                              : const Color(0xFF003A70),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          ref.read(configProvider.notifier).setRate(-0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: appConfig.ttsRate > 0.05
                                ? prefs.highContrast
                                    ? Colors.white
                                    : const Color(0xFF003A70)
                                : prefs.highContrast
                                    ? Colors.black
                                    : Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            color: prefs.highContrast
                                ? Colors.black
                                : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: orientation == Orientation.portrait
                            ? mq.width * 0.3
                            : mq.height * 0.3,
                        child: Text(
                          '${(appConfig.ttsRate * 100).round()}',
                          style: TextStyle(
                            fontSize: orientation == Orientation.portrait
                                ? mq.width * appConfig.factorSize
                                : mq.height * appConfig.factorSize,
                            fontWeight: FontWeight.normal,
                            color: prefs.highContrast
                                ? Colors.white
                                : const Color(0xFF003A70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(configProvider.notifier).setRate(0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: appConfig.ttsRate < 1
                                ? prefs.highContrast
                                    ? Colors.white
                                    : const Color(0xFF003A70)
                                : prefs.highContrast
                                    ? Colors.black
                                    : Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            color: prefs.highContrast
                                ? Colors.black
                                : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? mq.width * 0.04
                      : mq.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Tono',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * appConfig.factorSize
                              : mq.height * appConfig.factorSize,
                          fontWeight: FontWeight.bold,
                          color: prefs.highContrast
                              ? Colors.white
                              : const Color(0xFF003A70),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          ref.read(configProvider.notifier).setPitch(-0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: appConfig.ttsPitch > 0.05
                                ? prefs.highContrast
                                    ? Colors.white
                                    : const Color(0xFF003A70)
                                : prefs.highContrast
                                    ? Colors.black
                                    : Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_left,
                            color: prefs.highContrast
                                ? Colors.black
                                : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: orientation == Orientation.portrait
                            ? mq.width * 0.3
                            : mq.height * 0.3,
                        child: Text(
                          '${(appConfig.ttsPitch * 100).round()}',
                          style: TextStyle(
                            fontSize: orientation == Orientation.portrait
                                ? mq.width * appConfig.factorSize
                                : mq.height * appConfig.factorSize,
                            fontWeight: FontWeight.normal,
                            color: prefs.highContrast
                                ? Colors.white
                                : const Color(0xFF003A70),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref.read(configProvider.notifier).setPitch(0.05);
                        },
                        borderRadius: BorderRadius.circular(500),
                        child: Container(
                          alignment: Alignment.center,
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          height: orientation == Orientation.portrait
                              ? mq.width * 0.1
                              : mq.height * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: appConfig.ttsPitch < 1
                                ? prefs.highContrast
                                    ? Colors.white
                                    : const Color(0xFF003A70)
                                : prefs.highContrast
                                    ? Colors.black
                                    : Colors.grey,
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            color: prefs.highContrast
                                ? Colors.black
                                : Colors.white,
                            size: orientation == Orientation.portrait
                                ? mq.width * 0.06
                                : mq.height * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? mq.width * 0.04
                      : mq.height * 0.04,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Material(
                    borderRadius: BorderRadius.circular(16),
                    color: prefs.highContrast ? Colors.white : Colors.blue,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        alignment: Alignment.center,
                        width: orientation == Orientation.portrait
                            ? mq.width * 0.6
                            : mq.height * 0.6,
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.2
                            : mq.height * 0.2,
                        child: Text(
                          'Probar voz'.toUpperCase(),
                          style: TextStyle(
                            fontSize: orientation == Orientation.portrait
                                ? mq.width * 0.68 * appConfig.factorSize
                                : mq.height * 0.68 * appConfig.factorSize,
                            fontWeight: FontWeight.bold,
                            color: prefs.highContrast
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        ref
                            .read(appTTSProvider.notifier)
                            .speak('Esto es una prueba de voz');
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: Column(
                    children: [
                      Text(
                        'Tamaño de texto',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * appConfig.factorSize
                              : mq.height * appConfig.factorSize,
                          fontWeight: FontWeight.bold,
                          color: prefs.highContrast
                              ? Colors.white
                              : const Color(0xFF003A70),
                        ),
                      ),
                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.04
                            : mq.height * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            color: appConfig.factorText == 'pequeño'
                                ? prefs.highContrast
                                    ? Colors.white
                                    : Colors.blue
                                : prefs.highContrast
                                    ? Colors.transparent
                                    : Colors.grey[400],
                            child: InkWell(
                              onTap: () {
                                ref
                                    .read(configProvider.notifier)
                                    .setFactorSize(mq.width, 'pequeño');
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: prefs.highContrast ? 2 : 0,
                                        color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Pequeño',
                                  style: TextStyle(
                                    color: appConfig.factorText == 'pequeño'
                                        ? prefs.highContrast
                                            ? Colors.black
                                            : Colors.white
                                        : Colors.white,
                                    fontSize:
                                        orientation == Orientation.portrait
                                            ? mq.width * appConfig.factorSize
                                            : mq.height * appConfig.factorSize,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: orientation == Orientation.portrait
                                ? mq.width * 0.02
                                : mq.height * 0.02,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            color: appConfig.factorText == 'predeterminado'
                                ? prefs.highContrast
                                    ? Colors.white
                                    : Colors.blue
                                : prefs.highContrast
                                    ? Colors.transparent
                                    : Colors.grey[400],
                            child: InkWell(
                              onTap: () {
                                ref
                                    .read(configProvider.notifier)
                                    .setFactorSize(mq.width, 'predeterminado');
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: prefs.highContrast ? 2 : 0,
                                        color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Predeterminado',
                                  style: TextStyle(
                                    color:
                                        appConfig.factorText == 'predeterminado'
                                            ? prefs.highContrast
                                                ? Colors.black
                                                : Colors.white
                                            : Colors.white,
                                    fontSize:
                                        orientation == Orientation.portrait
                                            ? mq.width * appConfig.factorSize
                                            : mq.height * appConfig.factorSize,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: orientation == Orientation.portrait
                                ? mq.width * 0.02
                                : mq.height * 0.02,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            color: appConfig.factorText == 'grande'
                                ? prefs.highContrast
                                    ? Colors.white
                                    : Colors.blue
                                : prefs.highContrast
                                    ? Colors.transparent
                                    : Colors.grey[400],
                            child: InkWell(
                              onTap: () {
                                ref
                                    .read(configProvider.notifier)
                                    .setFactorSize(mq.width, 'grande');
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: prefs.highContrast ? 2 : 0,
                                        color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Grande',
                                  style: TextStyle(
                                    color: appConfig.factorText == 'grande'
                                        ? prefs.highContrast
                                            ? Colors.black
                                            : Colors.white
                                        : Colors.white,
                                    fontSize:
                                        orientation == Orientation.portrait
                                            ? mq.width * appConfig.factorSize
                                            : mq.height * appConfig.factorSize,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      Text(
                        'Estilo de teclado',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * appConfig.factorSize
                              : mq.height * appConfig.factorSize,
                          fontWeight: FontWeight.bold,
                          color: prefs.highContrast
                              ? Colors.white
                              : const Color(0xFF003A70),
                        ),
                      ),
                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.04
                            : mq.height * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            color: !appConfig.highlightFont!
                                ? prefs.highContrast
                                    ? Colors.white
                                    : Colors.blue
                                : prefs.highContrast
                                    ? Colors.transparent
                                    : Colors.grey[400],
                            child: InkWell(
                              onTap: () {
                                ref
                                    .read(configProvider.notifier)
                                    .setHighlightFont(false);
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: prefs.highContrast ? 2 : 0,
                                        color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Predeterminado',
                                  style: TextStyle(
                                    color: !appConfig.highlightFont!
                                        ? prefs.highContrast
                                            ? Colors.black
                                            : Colors.white
                                        : Colors.white,
                                    fontSize:
                                        orientation == Orientation.portrait
                                            ? mq.width * appConfig.factorSize
                                            : mq.height * appConfig.factorSize,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: orientation == Orientation.portrait
                                ? mq.width * 0.02
                                : mq.height * 0.02,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            color: appConfig.highlightFont!
                                ? prefs.highContrast
                                    ? Colors.white
                                    : Colors.blue
                                : prefs.highContrast
                                    ? Colors.transparent
                                    : Colors.grey[400],
                            child: InkWell(
                              onTap: () {
                                ref
                                    .read(configProvider.notifier)
                                    .setHighlightFont(true);
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: prefs.highContrast ? 2 : 0,
                                        color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Letras resaltadas',
                                  style: TextStyle(
                                    color: appConfig.highlightFont!
                                        ? prefs.highContrast
                                            ? Colors.black
                                            : Colors.white
                                        : Colors.white,
                                    fontSize:
                                        orientation == Orientation.portrait
                                            ? mq.width * appConfig.factorSize
                                            : mq.height * appConfig.factorSize,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 20.0),
                  child: Column(
                    children: [
                      Text(
                        'Diseño de pantalla',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * appConfig.factorSize
                              : mq.height * appConfig.factorSize,
                          fontWeight: FontWeight.bold,
                          color: prefs.highContrast
                              ? Colors.white
                              : const Color(0xFF003A70),
                        ),
                      ),
                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.04
                            : mq.height * 0.04,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            color: appConfig.highContrast
                                ? prefs.highContrast
                                    ? Colors.transparent
                                    : Colors.grey[400]
                                : prefs.highContrast
                                    ? Colors.white
                                    : Colors.blue,
                            child: InkWell(
                              onTap: () {
                                ref
                                    .read(configProvider.notifier)
                                    .setHighContrast(false);
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: prefs.highContrast ? 2 : 0,
                                        color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Predeterminado',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        orientation == Orientation.portrait
                                            ? mq.width * appConfig.factorSize
                                            : mq.height * appConfig.factorSize,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: orientation == Orientation.portrait
                                ? mq.width * 0.02
                                : mq.height * 0.02,
                          ),
                          Material(
                            borderRadius: BorderRadius.circular(16),
                            color: appConfig.highContrast
                                ? prefs.highContrast
                                    ? Colors.white
                                    : Colors.blue
                                : prefs.highContrast
                                    ? Colors.transparent
                                    : Colors.grey[400],
                            child: InkWell(
                              onTap: () {
                                ref
                                    .read(configProvider.notifier)
                                    .setHighContrast(true);
                              },
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        width: prefs.highContrast ? 2 : 0,
                                        color: Colors.white)),
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.center,
                                child: Text(
                                  'Alto contraste',
                                  style: TextStyle(
                                    color: prefs.highContrast
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize:
                                        orientation == Orientation.portrait
                                            ? mq.width * appConfig.factorSize
                                            : mq.height * appConfig.factorSize,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? mq.width * 0.08
                      : mq.height * 0.08,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Desarrollado por'.toUpperCase(),
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * 0.6 * appConfig.factorSize
                              : mq.height * 0.6 * appConfig.factorSize,
                          color: prefs.highContrast
                              ? Colors.white
                              : const Color(0xFF003A70),
                        ),
                      ),
                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.02
                            : mq.height * 0.02,
                      ),
                      Text(
                        'Clínica de Tecnología Asistiva, FLENI',
                        style: TextStyle(
                          fontSize: orientation == Orientation.portrait
                              ? mq.width * 0.8 * appConfig.factorSize
                              : mq.height * 0.8 * appConfig.factorSize,
                          color: prefs.highContrast
                              ? Colors.white
                              : const Color(0xFF003A70),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.08
                            : mq.height * 0.08,
                      ),
                      InkWell(
                        onTap: () async {
                          final Uri url = Uri(
                            scheme: 'https',
                            host: 'fleni.org.ar',
                            path: '/',
                          );
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Image.asset(
                          appConfig.highContrast
                              ? 'assets/images/fleni-logo-h.png'
                              : 'assets/images/fleni-logo.png',
                          width: orientation == Orientation.portrait
                              ? mq.width * 0.6
                              : mq.height * 0.6,
                        ),
                      ),
                      SizedBox(
                        height: orientation == Orientation.portrait
                            ? mq.width * 0.08
                            : mq.height * 0.08,
                      ),

                      // Image.asset(
                      //   'assets/images/fleni-logo.png',
                      //   width: orientation == Orientation.portrait
                      //       ? mq.width * 0.5
                      //       : mq.height * 0.5,
                      // ),
                      // SizedBox(
                      //   height: orientation == Orientation.portrait
                      //       ? mq.width * 0.08
                      //       : mq.height * 0.08,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     IconButton(
                      //       padding: const EdgeInsets.all(0),
                      //       onPressed: () async {
                      //         final Uri url = Uri(
                      //           scheme: 'https',
                      //           host: 'twitter.com',
                      //           path: '/FleniOficial',
                      //         );
                      //         if (await canLaunchUrl(url)) {
                      //           await launchUrl(url,
                      //               mode: LaunchMode.externalApplication);
                      //         } else {
                      //           throw 'Could not launch $url';
                      //         }
                      //       },
                      //       icon: FaIcon(
                      //         FontAwesomeIcons.xTwitter,
                      //         size: orientation ==
                      //                       Orientation.portrait
                      //                   ? mq.width * 2 *configProvider.factorSize!
                      //                   : mq.height * 2 *
                      //                       configProvider.factorSize!,
                      //         color: ColorApp.brandblue,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: orientation == Orientation.portrait
                      //           ? mq.width * 0.04
                      //           : mq.height * 0.04,
                      //     ),
                      //     IconButton(
                      //       padding: const EdgeInsets.all(0),
                      //       onPressed: () async {
                      //         final Uri url = Uri(
                      //           scheme: 'https',
                      //           host: 'instagram.com',
                      //           path: '/Fleni_Oficial',
                      //         );
                      //         if (await canLaunchUrl(url)) {
                      //           await launchUrl(url,
                      //               mode: LaunchMode.externalApplication);
                      //         } else {
                      //           throw 'Could not launch $url';
                      //         }
                      //       },
                      //       icon: FaIcon(
                      //         FontAwesomeIcons.instagram,
                      //         size: orientation ==
                      //                       Orientation.portrait
                      //                   ? mq.width * 2 *configProvider.factorSize!
                      //                   : mq.height * 2 *
                      //                       configProvider.factorSize!,
                      //         color: ColorApp.brandblue,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: orientation == Orientation.portrait
                      //           ? mq.width * 0.04
                      //           : mq.height * 0.04,
                      //     ),
                      //     IconButton(
                      //       padding: const EdgeInsets.all(0),
                      //       onPressed: () async {
                      //         final Uri url = Uri(
                      //           scheme: 'https',
                      //           host: 'facebook.com',
                      //           path: '/FleniOficial',
                      //         );
                      //         if (await canLaunchUrl(url)) {
                      //           await launchUrl(url,
                      //               mode: LaunchMode.externalApplication);
                      //         } else {
                      //           throw 'Could not launch $url';
                      //         }
                      //       },
                      //       icon: FaIcon(
                      //         FontAwesomeIcons.facebook,
                      //         size: orientation ==
                      //                       Orientation.portrait
                      //                   ? mq.width *2 * configProvider.factorSize!
                      //                   : mq.height * 2 *
                      //                       configProvider.factorSize!,
                      //         color: ColorApp.brandblue,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: orientation == Orientation.portrait
                      //           ? mq.width * 0.04
                      //           : mq.height * 0.04,
                      //     ),
                      //     IconButton(
                      //       padding: const EdgeInsets.all(0),
                      //       onPressed: () async {
                      //         final Uri url = Uri(
                      //           scheme: 'https',
                      //           host: 'youtube.comm',
                      //           path: '/user/InfoFLENI',
                      //         );
                      //         if (await canLaunchUrl(url)) {
                      //           await launchUrl(url,
                      //               mode: LaunchMode.externalApplication);
                      //         } else {
                      //           throw 'Could not launch $url';
                      //         }
                      //       },
                      //       icon: FaIcon(
                      //         FontAwesomeIcons.youtube,
                      //         size: orientation ==
                      //                       Orientation.portrait
                      //                   ? mq.width * 2 *configProvider.factorSize!
                      //                   : mq.height * 2 *
                      //                       configProvider.factorSize!,
                      //         color: ColorApp.brandblue,
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: orientation == Orientation.portrait
                      //           ? mq.width * 0.04
                      //           : mq.height * 0.04,
                      //     ),
                      //     IconButton(
                      //       padding: const EdgeInsets.all(0),
                      //       onPressed: () async {
                      //         final Uri url = Uri(
                      //           scheme: 'https',
                      //           host: 'api.whatsapp.com',
                      //           path:
                      //               '/send/?phone=541156551155&text&type=phone_number&app_absent=0',
                      //         );
                      //         if (await canLaunchUrl(url)) {
                      //           await launchUrl(url,
                      //               mode: LaunchMode.externalApplication);
                      //         } else {
                      //           throw 'Could not launch $url';
                      //         }
                      //       },
                      //       icon: FaIcon(
                      //         FontAwesomeIcons.whatsapp,
                      //         size: orientation ==
                      //                       Orientation.portrait
                      //                   ? mq.width *2 * configProvider.factorSize!
                      //                   : mq.height * 2 *
                      //                       configProvider.factorSize!,
                      //         color: ColorApp.brandblue,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: orientation == Orientation.portrait
                      //       ? mq.width * 0.04
                      //       : mq.height * 0.04,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 20.0),
                      //   child: Container(
                      //     width: double.infinity,
                      //     child: TextButton(
                      //       style: ButtonStyle(
                      //         foregroundColor: MaterialStateProperty.all<Color>(
                      //             ColorApp.primaryLight),
                      //         shape: MaterialStateProperty.all<OutlinedBorder>(
                      //             StadiumBorder()),
                      //         backgroundColor: MaterialStateProperty.all<Color>(
                      //             ColorApp.brandblue),
                      //         padding:
                      //             MaterialStateProperty.all<EdgeInsetsGeometry>(
                      //                 EdgeInsets.symmetric(horizontal: 20)),
                      //       ),
                      //       onPressed: () async {
                      //         final Uri url = Uri(
                      //           scheme: 'https',
                      //           host: 'fleni.org.ar',
                      //           path: '/',
                      //         );
                      //         if (await canLaunchUrl(url)) {
                      //           await launchUrl(url,
                      //               mode: LaunchMode.externalApplication);
                      //         } else {
                      //           throw 'Could not launch $url';
                      //         }
                      //       },
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(30.0),
                      //         child: Text(
                      //           'Página web',
                      //           style: TextStyle(color: Colors.white,
                      //                 fontSize: orientation ==
                      //                         Orientation.portrait
                      //                     ? mq.width * configProvider.factorSize!
                      //                     : mq.height *
                      //                         configProvider.factorSize!,),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 20),
                      //   child: Container(
                      //     width: double.infinity,
                      //     child: TextButton(
                      //       style: ButtonStyle(
                      //         foregroundColor: MaterialStateProperty.all<Color>(
                      //             ColorApp.primaryLight),
                      //         shape: MaterialStateProperty.all<OutlinedBorder>(
                      //             StadiumBorder( side: BorderSide(width: 4, color: ColorApp.brandblue))),
                      //         backgroundColor: MaterialStateProperty.all<Color>(
                      //             Colors.transparent),

                      //         padding:
                      //             MaterialStateProperty.all<EdgeInsetsGeometry>(
                      //                 EdgeInsets.symmetric(horizontal: 20)),
                      //       ),
                      //       onPressed: () async {
                      //         final Uri url = Uri(
                      //           scheme: 'https',
                      //           host: 'fleni.org.ar',
                      //           path: '/institucional/donar/',
                      //         );
                      //         if (await canLaunchUrl(url)) {
                      //           await launchUrl(url,
                      //               mode: LaunchMode.externalApplication);
                      //         } else {
                      //           throw 'Could not launch $url';
                      //         }
                      //       },
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(30.0),
                      //         child: Text('Donar',
                      //             style: TextStyle(color: ColorApp.brandblue,
                      //                 fontSize: orientation ==
                      //                         Orientation.portrait
                      //                     ? mq.width * configProvider.factorSize!
                      //                     : mq.height *
                      //                         configProvider.factorSize!,),),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

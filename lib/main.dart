import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tagrupo/src/app.dart';
import 'package:tagrupo/src/data/local/user_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // pantalla completa
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  // orientacion vertical
  //await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  // statusbar transparente

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  final prefs = UserPreferences();
  await prefs.initPrefs();
  runApp(
    const ProviderScope(child: TAGrupo()),
  );
}

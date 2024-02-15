import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tagrupo/src/app.dart';
import 'package:tagrupo/src/data/local/user_preferences.dart';
import 'package:tagrupo/src/provider/config_provider.dart';
import 'package:tagrupo/src/provider/tts_provider.dart';

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
  //final localDB = LocalData();
  //await localDB.init();
  //await localDB.openBox();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TTSProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ConfigProvider(),
        ),
      ],
      child: const TAGrupo(),
    ),
  );
}

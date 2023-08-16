import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tecgrupo/src/provider/config_provider.dart';
import 'package:tecgrupo/src/provider/tts_provider.dart';
import 'package:tecgrupo/src/utils/transitions.dart';
import 'package:tecgrupo/src/views/pages/configPage/config_page.dart';
import 'package:tecgrupo/src/views/pages/homePage/widgets/field_text.dart';
import 'package:tecgrupo/src/views/pages/homePage/widgets/keys_group.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final ttsProvider = Provider.of<TTSProvider>(context, listen: false);
    ttsProvider.initLanguages();
    final configProvider = Provider.of<ConfigProvider>(context, listen: false);
    configProvider.initConfig();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'TecGrupo',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFF003A70),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                FadeTransitionRoute(
                  widget: const ConfigPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: const [
            FieldTextWidget(),
            Expanded(child: KeysGroup()),
          ],
        ),
      ),
    );
  }
}

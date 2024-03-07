import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tagrupo/src/provider/config_provider.dart';
import 'package:tagrupo/src/provider/tts_provider.dart';
import 'package:tagrupo/src/utils/transitions.dart';
import 'package:tagrupo/src/views/pages/configPage/config_page.dart';
import 'package:tagrupo/src/views/pages/homePage/widgets/buttons_action.dart';
import 'package:tagrupo/src/views/pages/homePage/widgets/field_text.dart';
import 'package:tagrupo/src/views/pages/homePage/widgets/keys_group.dart';

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
    final configProvider = Provider.of<ConfigProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
          configProvider.highContrast! ? Colors.black : Colors.white,
      appBar: MediaQuery.of(context).orientation == Orientation.portrait
          ? AppBar(
              title: const Text(
                'TA Grupo',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SafeArea(
                child: SizedBox.shrink(),
              ),
            ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            MediaQuery.of(context).orientation != Orientation.portrait
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Expanded(child: FieldTextWidget()),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      const ButtonsActionWidget()
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const FieldTextWidget(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.04,
                      ),
                      const ButtonsActionWidget()
                    ],
                  ),
            const Expanded(child: KeysGroup()),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tecgrupo/src/provider/config_provider.dart';
import 'package:tecgrupo/src/provider/tts_provider.dart';

class SpaceButton extends StatelessWidget {
  const SpaceButton({super.key});

  @override
  Widget build(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context);
    final ttsProvider = Provider.of<TTSProvider>(context, listen: false);
    return Material(
      borderRadius: BorderRadius.circular(16),
      color: Colors.black12,
      child: InkWell(
        onTap: () {
          HapticFeedback.lightImpact();
          ttsProvider.setText(' ');
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
            ' '.toUpperCase(),
            style: TextStyle(
              fontSize:
                  MediaQuery.of(context).orientation == Orientation.portrait
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
    );
  }
}

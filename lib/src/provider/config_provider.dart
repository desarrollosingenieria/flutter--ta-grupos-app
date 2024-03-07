// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tagrupo/src/constants/constants.dart';
import 'package:tagrupo/src/data/local/user_preferences.dart';
import 'package:tagrupo/src/models/app_config.dart';

part 'config_provider.g.dart';

@Riverpod(keepAlive: true)
class Config extends _$Config {
  final prefs = UserPreferences();
  @override
  AppConfig build() => AppConfig(
        factorSize: prefs.factorSize,
        factorText: prefs.factorText,
        highContrast: prefs.highContrast,
        ttsVolume: prefs.volume,
        ttsPitch: prefs.pitch,
        ttsRate: prefs.rate,
        highlightFont: prefs.highlightFont,
      );

  void setFactorSize(double size, String factorText) {
    double? factorSize;
    if (factorText == 'grande') {
      prefs.factorText = factorText;
      prefs.factorSize = size > MEDIUM_SCREEN_SIZE ? 0.04 : 0.08;
      factorSize = size > MEDIUM_SCREEN_SIZE ? 0.04 : 0.08;
    } else if (factorText == 'predeterminado') {
      prefs.factorText = factorText;
      prefs.factorSize = size > MEDIUM_SCREEN_SIZE ? 0.036 : 0.06;
      factorSize = size > MEDIUM_SCREEN_SIZE ? 0.036 : 0.06;
    } else {
      prefs.factorText = factorText;
      prefs.factorSize = size > MEDIUM_SCREEN_SIZE ? 0.03 : 0.054;
      factorSize = size > MEDIUM_SCREEN_SIZE ? 0.03 : 0.054;
    }
    state = state.copyWith(factorText: factorText, factorSize: factorSize);
  }

  void setHighContrast(bool status) {
    prefs.highContrast = status;
    state = state.copyWith(highContrast: status);
  }

  Future<void> setVolume(double volume) async {
    double _volume = prefs.volume;
    if (_volume + volume > 0 && _volume + volume <= 1) {
      HapticFeedback.lightImpact();
      _volume += volume;
      prefs.volume = double.parse(_volume.toStringAsFixed(2));
      state = state.copyWith(ttsVolume: _volume);
    }
  }

  Future<void> setPitch(double pitch) async {
    double _pitch = prefs.pitch;
    if (_pitch + pitch > 0 && _pitch + pitch <= 1) {
      HapticFeedback.lightImpact();
      _pitch += pitch;
      prefs.pitch = double.parse(_pitch.toStringAsFixed(2));
      state = state.copyWith(ttsPitch: _pitch);
    }
  }

  Future<void> setRate(double rate) async {
    double _rate = prefs.rate;
    if (_rate + rate > 0 && _rate + rate <= 1) {
      HapticFeedback.lightImpact();
      _rate += rate;
      prefs.rate = double.parse(_rate.toStringAsFixed(2));
      state = state.copyWith(ttsRate: _rate);
    }
  }

  void setHighlightFont(bool status) {
    prefs.highlightFont = status;
    state = state.copyWith(highlightFont: status);
  }

  void setText(String text) {
    String newText = state.ttsText ?? '';
    newText += text;
    state = state.copyWith(ttsText: newText);
  }

  void deleteAllText() {
    state = state.copyWith(ttsText: '');
  }

  void deleteLast() {
    String? newText;
    if (state.ttsText!.isNotEmpty) {
      newText = state.ttsText!.substring(0, state.ttsText!.length - 1);
      state = state.copyWith(ttsText: newText);
    }
  }
}

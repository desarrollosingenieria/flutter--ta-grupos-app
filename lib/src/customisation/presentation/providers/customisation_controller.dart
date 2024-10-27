import 'package:tagrupos/core/constants/constants.dart';
import 'package:tagrupos/src/customisation/application/services/customisation_service.dart';
import 'package:tagrupos/src/customisation/domain/entities/app_parameters.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customisation_controller.g.dart';

@Riverpod(keepAlive: true)
class CustomisationController extends _$CustomisationController {
  final CustomisationService customisationService = CustomisationService();

  @override
  AppParameters build() => CustomisationService().appParameters;

  Future<AppParameters> getAppParameters() async {
    return customisationService.getAppParameters();
  }

  Future<bool> setHighContrast({required bool highContrast}) async {
    final AppParameters parameters = AppParameters(
      highContrast: highContrast,
      factorSize: state.factorSize,
      factorText: state.factorText,
      fontStyle: state.fontStyle,
      keyboardStyle: state.keyboardStyle,
    );
    state = parameters;
    return customisationService.setAppParameters(parameters);
  }

  Future<bool> setKeyboardStyle({required String keyboardStyle}) async {
    final AppParameters parameters = AppParameters(
      highContrast: state.highContrast,
      factorSize: state.factorSize,
      factorText: state.factorText,
      fontStyle: state.fontStyle,
      keyboardStyle: keyboardStyle,
    );
    state = parameters;
    return customisationService.setAppParameters(parameters);
  }

  Future<bool> setFontStyle({required String fontStyle}) async {
    final AppParameters parameters = AppParameters(
      highContrast: state.highContrast,
      factorSize: state.factorSize,
      factorText: state.factorText,
      fontStyle: fontStyle,
      keyboardStyle: state.keyboardStyle,
    );
    state = parameters;
    return customisationService.setAppParameters(parameters);
  }

  Future<bool> setFactorText(
      {required double size, required String factorText}) async {
    double factorSize;
    switch (factorText) {
      case FACTOR_TEXT_SMALL:
        factorSize = size > MEDIUM_SCREEN_SIZE ? 0.03 : 0.054;
        break;
      case FACTOR_TEXT_DEFAULT:
        factorSize = size > MEDIUM_SCREEN_SIZE ? 0.036 : 0.06;
        break;
      case FACTOR_TEXT_BIG:
        factorSize = size > MEDIUM_SCREEN_SIZE ? 0.04 : 0.08;
        break;
      case FACTOR_TEXT_EXTRA_BIG:
        factorSize = size > MEDIUM_SCREEN_SIZE ? 0.06 : 0.1;
        break;
      default:
        factorSize = size > MEDIUM_SCREEN_SIZE ? 0.036 : 0.06;
        break;
    }

    final AppParameters parameters = AppParameters(
      highContrast: state.highContrast,
      factorSize: factorSize,
      factorText: factorText,
      fontStyle: state.fontStyle,
      keyboardStyle: state.keyboardStyle,
    );

    state = parameters;
    return customisationService.setAppParameters(parameters);
  }

  Future<bool> setAppParameters(AppParameters parameters) async {
    return customisationService.setAppParameters(parameters);
  }

  Future<bool> clearAppParameters() async {
    return customisationService.clearAppParameters();
  }
}

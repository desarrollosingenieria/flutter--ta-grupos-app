import 'package:tagrupos/core/constants/constants.dart';
import 'package:tagrupos/src/customisation/domain/entities/app_parameters.dart';

class AppParametersModel extends AppParameters {
  AppParametersModel(
      {required super.factorSize,
      required super.factorText,
      required super.keyboardStyle,
      required super.fontStyle,
      required super.highContrast});

  static AppParametersModel empty = AppParametersModel(
    factorSize: 0.03,
    factorText: FACTOR_TEXT_DEFAULT,
    keyboardStyle: DEFAULT_KEYBOARD_STYLE,
    fontStyle: DEFAULT_FONT_STYLE,
    highContrast: false,
  );

  AppParametersModel copyWith({
    double? factorSize,
    String? factorText,
    String? keyboardStyle,
    bool? highContrast,
    String? fontStyle,
  }) =>
      AppParametersModel(
          factorSize: factorSize ?? this.factorSize,
          factorText: factorText ?? this.factorText,
          fontStyle: fontStyle ?? this.fontStyle,
          keyboardStyle: keyboardStyle ?? this.keyboardStyle,
          highContrast: highContrast ?? this.highContrast);

  Map<dynamic, dynamic> toJson() => {
        'factorSize': factorSize,
        'factorText': factorText,
        'keyboardStyle': keyboardStyle,
        'fontStyle': fontStyle,
        'highContrast': highContrast,
      };

  factory AppParametersModel.fromJson(Map<dynamic, dynamic> json) =>
      AppParametersModel(
        factorSize: json['factorSize'],
        factorText: json['factorText'],
        fontStyle: json['fontStyle'],
        keyboardStyle: json['keyboardStyle'],
        highContrast: json['highContrast'],
      );

  factory AppParametersModel.fromEntity(AppParameters entity) =>
      AppParametersModel(
        factorSize: entity.factorSize,
        factorText: entity.factorText,
        fontStyle: entity.fontStyle,
        keyboardStyle: entity.keyboardStyle,
        highContrast: entity.highContrast,
      );
}

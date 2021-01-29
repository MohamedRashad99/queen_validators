import 'package:queen_validators/src/exception.dart';
import 'package:queen_validators/src/imp/validation.dart';

abstract class QueenDto {
  QueenDto() {
    _validate();
  }

  /// trigerrs when new instace is created
  /// ! might throw  QValidationException
  void _validate() {
    Map<String, List<String>> errorsResponse = {};
    final objMap = toMap();
    rules.forEach((key, value) {
      List<String> errors = [];
      value.forEach((element) {
        final currentRuleError = element.run(objMap[key]);
        if (currentRuleError != null) errors.add(currentRuleError);
      });
      if (errors.isNotEmpty) errorsResponse[key] = errors;
    });

    throw QValidationException(errorsResponse);
  }

  Map<String, dynamic> toMap();

  Map<String, List<QueenValidationRule>> get rules;
}

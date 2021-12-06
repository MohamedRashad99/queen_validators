import 'package:nations/nations.dart';
import 'package:queen_validators/queen_validators.dart';

class IsDate extends TextValidationRule {
  const IsDate();

  @override
  bool isValid(String input) => isDate(input);

  @override
  String get error => 'is_not_date_format'.tr;
}

/// checks if the input is a valid `date` to parse by Dart `DateTime` class
bool isDate(String? v) => DateTime.tryParse(v ?? '') != null;

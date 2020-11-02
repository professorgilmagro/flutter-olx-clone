import 'package:xlo_mobx/helpers/validator.dart';

class FieldChecker {
  final String field;
  final String value;
  String _message = '';

  FieldChecker(this.field, this.value);

  String get message {
    if (_message.isEmpty && value != null) {
      _message = FormValidator.validation(value: value, fieldName: field) ?? '';
    }

    return _message;
  }

  bool get isOK {
    if (value == null) return null;
    return message.isEmpty;
  }

  bool get canSubmit {
    return value != null && message.isEmpty;
  }
}

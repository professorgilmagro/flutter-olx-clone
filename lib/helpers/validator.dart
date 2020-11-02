import 'package:email_validator/email_validator.dart';
import 'package:the_validator/the_validator.dart';

class FormValidator {
  String value;
  String message;

  FormValidator(this.value);

  static String validation({String value, String fieldName}) {
    final validator = FormValidator(value);
    return validator.validate(fieldName);
  }

  static bool isValidEmail(String value) {
    return FormValidator(value).validateEmail() == null;
  }

  static bool isValidPassword(String value) {
    return FormValidator(value).validatePassword() == null;
  }

  static bool isValidPhone(String value) {
    print(value);
    return FormValidator(value).validatePhone() == null;
  }

  static bool isValidName(String value) {
    return FormValidator(value).validateName() == null;
  }

  String validateName() {
    return validate('name');
  }

  String validateEmail() {
    return validate('email');
  }

  String validatePhone() {
    return validate('phone');
  }

  String validatePassword() {
    return validate('password');
  }

  String validate(String field) {
    String message;
    switch (field) {
      case 'name':
        message = _checkName();
        break;
      case 'email':
        message = _checkEmail();
        break;
      case 'phone':
        message = _checkPhone();
        break;
      case 'password':
        message = _checkPassword();
        break;
    }

    return message;
  }

  _checkName() {
    if (value.isEmpty) return 'O nome é obrigatório';

    final names = value.split(' ');
    if (names.length < 2 || names[1].length < 2) {
      return 'Entre com o nome e sobrenome';
    }

    return null;
  }

  _checkEmail() {
    if (value.isEmpty) {
      return 'Email é obrigatório';
    }

    if (!EmailValidator.validate(value)) {
      return 'E-mail inválido!';
    }

    return null;
  }

  _checkPhone() {
    if (value.isEmpty) {
      return 'Telefone é obrigatório';
    }

    if (value.length < 15) {
      return 'Telefone inválido';
    }

    return null;
  }

  _checkPassword() {
    if (value.isEmpty) {
      return 'Informe a senha';
    }

    if (_isValidPass) {
      return null;
    }

    return 'A senha não atende os requisitos de segurança.';
  }

  bool get _isValidPass {
    return Validator.isPassword(
      value,
      minLength: 8,
      shouldContainCapitalLetter: true,
      shouldContainNumber: true,
      shouldContainSpecialChars: true,
    );
  }
}

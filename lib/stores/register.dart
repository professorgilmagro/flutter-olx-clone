import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/validator.dart';

part 'register.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  @observable
  @observable
  String email = '';

  @observable
  String error = '';

  @observable
  String password = '';

  @observable
  bool showPass = false;

  @observable
  bool loading = false;

  @observable
  String phone = '';

  @observable
  String confirm = '';

  @observable
  String name = '';

  @action
  void toggleVisibility() => showPass = !showPass;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setConfirmPass(String value) => confirm = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setName(String value) => name = value;

  @computed
  bool get passConfirmed {
    return password.isNotEmpty && password == confirm;
  }

  @computed
  bool get isMailValid => FormValidator.isValidEmail(email);

  @computed
  bool get isNameValid => FormValidator.isValidName(name);

  @computed
  bool get isPassValid => FormValidator.isValidPassword(password);

  @computed
  bool get isPhoneValid => FormValidator.isValidPhone(phone);

  @computed
  bool get isPhoneOk {
    if (phone.isEmpty) return null;
    return isPhoneValid;
  }

  @computed
  bool get canSubmit {
    return isMailValid &&
        isNameValid &&
        isPassValid &&
        isPhoneValid &&
        passConfirmed;
  }

  List<TextInputFormatter> get phoneFormatters {
    return [
      MaskTextInputFormatter(
        mask: '(##) #####-####',
        filter: {
          "#": RegExp(r'[0-9]'),
        },
      )
    ];
  }

  @action
  Future<void> register() async {
    loading = true;
    await Future.delayed(Duration(seconds: 2));
    loading = false;
  }
}

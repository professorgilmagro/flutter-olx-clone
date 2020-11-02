import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/checker_field.dart';
import 'package:xlo_mobx/models/User.dart';
import 'package:xlo_mobx/repositories/user.dart';

part 'register.g.dart';

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  @observable
  String email;

  @observable
  String error = '';

  @observable
  String password;

  @observable
  bool showPass = false;

  @observable
  bool loading = false;

  @observable
  String phone;

  @observable
  String confirm;

  @observable
  String name;

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
    return password != null && password == confirm;
  }

  @computed
  FieldChecker get nameChecker {
    return FieldChecker('name', name);
  }

  @computed
  FieldChecker get emailChecker {
    return FieldChecker('email', email);
  }

  @computed
  FieldChecker get phoneChecker {
    return FieldChecker('phone', phone);
  }

  @computed
  FieldChecker get passChecker {
    return FieldChecker('password', password);
  }

  @computed
  bool get canSubmit {
    return emailChecker.canSubmit &&
        nameChecker.canSubmit &&
        passChecker.canSubmit &&
        phoneChecker.canSubmit &&
        passConfirmed;
  }

  @computed
  Future<void> Function() get registerPressed {
    return canSubmit ? register : null;
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
    try {
      await UserRepository(_user).signUp();
    } catch (message) {
      error = message;
    }

    loading = false;
  }

  User get _user {
    return User(name: name, email: email, phone: phone, password: password);
  }
}

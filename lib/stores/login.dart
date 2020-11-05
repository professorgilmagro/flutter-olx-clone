import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/validator.dart';
import 'package:xlo_mobx/repositories/user.dart';
import 'package:xlo_mobx/stores/user_manager.dart';

part 'login.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  bool signIn = false;

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

  @action
  void toggleVisibility() => showPass = !showPass;

  @action
  void setSignIn(bool value) => signIn = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  String emailValidator(email) {
    if (email != null) {
      return FormValidator(email).validateEmail();
    }

    return null;
  }

  @action
  Future<void> login() async {
    loading = true;
    error = '';

    try {
      final loggedUser = await UserRepository.loginWithEmail(email, password);
      GetIt.I<UserManagerStore>().setUser(loggedUser);
      signIn = true;
    } catch (message) {
      error = message.toString();
    }

    loading = false;
  }

  @computed
  bool get canSubmit {
    return FormValidator.isValidEmail(email) &&
        FormValidator.isValidPassword(password);
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
}

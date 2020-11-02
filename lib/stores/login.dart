import 'package:mobx/mobx.dart';

part 'login.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  bool signIn = false;

  @action
  void setSignIn(bool value) => signIn = value;
}

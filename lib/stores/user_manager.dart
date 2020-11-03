import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/User.dart';

part 'user_manager.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {
  @observable
  User user;

  @action
  void setUser(User value) => user = value;
}

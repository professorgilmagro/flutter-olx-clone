import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/User.dart';
import 'package:xlo_mobx/repositories/user.dart';

part 'user_manager.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store {
  @observable
  bool loading = false;

  @observable
  User user;

  @observable
  String error;

  _UserManagerStore() {
    _getCurrentUser();
  }

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

  @action
  Future<void> logout() async {
    loading = true;

    try {
      await UserRepository.logout(user);
      user = null;
    } catch (message) {
      error = message;
    }

    loading = false;
  }

  Future<void> _getCurrentUser() async {
    final user = await UserRepository.currentUser();
    setUser(user);
  }
}

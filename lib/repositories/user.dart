import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/helpers/parse_code_errors.dart';
import 'package:xlo_mobx/models/User.dart';
import 'package:xlo_mobx/repositories/base.dart';

class UserRepository extends BaseRepository {
  UserRepository(User model) : super(model);

  Future<void> signUp() async {
    final user = model as User;
    final parseUser = ParseUser(user.email, user.password, user.email);
    parseUser
      ..set<String>('name', user.name)
      ..set<String>('phone', user.phone)
      ..set<int>('type', user.type.index);

    final response = await parseUser.signUp();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  static Future<User> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);
    final response = await parseUser.login();
    if (response.success) {
      return User.fromParse(response.result);
    }

    return Future.error(ParseErrors.getDescription(response.error.code));
  }

  static Future<void> logout(User user) async {
    final parseUser = ParseUser(user.email, user.password, null);
    final response = await parseUser.logout();
    if (!response.success) {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  static Future<User> currentUser() async {
    final parseUser = await ParseUser.currentUser();
    if (parseUser == null) return null;

    final token = parseUser.sessionToken;
    final response = await ParseUser.getCurrentUserFromServer(token);
    if (response.success) {
      return User.fromParse(response.result);
    }

    await parseUser.logout();
    return null;
  }
}

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
}

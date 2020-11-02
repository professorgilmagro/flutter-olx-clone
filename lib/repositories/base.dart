import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/models/Base.dart';
import 'package:xlo_mobx/services/api.dart';

abstract class BaseRepository {
  final BaseModel model;

  BaseRepository(this.model);

  Future<Parse> get server async => (await Api.instance).server;

  QueryBuilder get query => QueryBuilder(object);

  ParseObject get object => ParseObject(model.tableName);

  Future<bool> delete() async {
    final response = await object.delete(id: this.model.id);
    return response.success;
  }

  Future<bool> save() async {
    object.objectId = this.model.id;
    object.fromJson(this.model.toJson());
    final response = await object.save();
    return response.success;
  }
}

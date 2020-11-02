import 'package:xlo_mobx/models/Base.dart';

class Category extends BaseModel {
  @override
  String id;

  String name;
  int position;

  @override
  String get tableName => 'Categories';

  Category({this.id, this.position, this.name});

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'position': position,
    };
  }

  @override
  factory Category.fromJson(Map<String, dynamic> data) {
    return Category.fromJson(data);
  }

  @override
  Category fromJson(Map<String, dynamic> data) {
    id = data['id'] ?? null;
    name = data['name'] ?? null;
    position = data['position'] ?? null;

    return this;
  }
}

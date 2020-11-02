abstract class BaseModel {
  String id;
  String get tableName;
  Map<String, dynamic> toJson();

  BaseModel fromJson(Map<String, dynamic> data);

  @override
  String toString() {
    return toJson().toString();
  }
}

part of 'User.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['login'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic> {
  'login': instance.login,
  'name': instance.name,
};
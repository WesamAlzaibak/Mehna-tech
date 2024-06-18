import 'package:mehna_tech/auth/domain/entities/Login.dart';
import 'package:mehna_tech/core/network/cache_helper.dart';

class LoginModel extends Login {
  const LoginModel(Future<bool>? saveDataInt, Future<bool>? saveData, Future<bool>? save2Data, {
    required super.token,
    required super.picture,
    required super.id,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["access_token"],
    picture: json["picture"],
    id: json["id"],
    CacheHelper.saveDataInt(key: 'id', value: json['id']),
    CacheHelper.saveData(key: 'picture', value: json['picture']),
    CacheHelper.saveData(key: 'access_token', value: json['access_token']),
  );
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quick_wait_android/commons/config/config.dart';
import 'package:quick_wait_android/features/auth/domain/entities/user_entity.dart';
import 'package:quick_wait_android/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  
   Future <UserEntity> login({required String email, required String password}) async {
    var map = new Map<String, dynamic>();
    map['username'] = '$email';
    map['password'] = '$password';

    final response = await http.post(Uri.parse("$API_URL/login"), body: map);
    final data = json.decode(response.body);
    return UserEntity(name: data['name'], password: data['password']);
  }
}
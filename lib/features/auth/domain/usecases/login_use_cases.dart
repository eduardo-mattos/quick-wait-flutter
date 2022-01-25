import 'dart:convert';
import 'package:quick_wait_android/features/auth/domain/entities/user_entity.dart';
import 'package:quick_wait_android/features/auth/domain/repositories/auth_repository.dart';

abstract class LoginUseCase {
  
  Future <UserEntity> call({required String email, required String password});
}

class LoginUseCaseImpl implements LoginUseCase {

  final AuthRepository repository;

  LoginUseCaseImpl(this.repository);

  @override
  Future <UserEntity> call({required String email, required String password}) async {
    return repository.login(email: email, password: password);
  }
}
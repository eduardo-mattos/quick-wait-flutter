import 'package:quick_wait_android/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  
   Future <UserEntity> login({required String email, required String password});
}
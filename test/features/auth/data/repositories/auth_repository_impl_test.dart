import 'package:flutter_test/flutter_test.dart';
import 'package:quick_wait_android/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:quick_wait_android/features/auth/domain/entities/user_entity.dart';

void main() {
  test("should return the login user", () async {
    final repo = AuthRepositoryImpl();

    final user = await repo.login(email: "test@test.com", password: "123456");

    expect(user, isA<UserEntity>());
  });
}

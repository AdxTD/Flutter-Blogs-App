// ignore: implementation_imports
import 'package:fpdart/src/either.dart';

import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements UseCase<User, SignUpData> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(SignUpData params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpData {
  final String name;
  final String email;
  final String password;

  SignUpData({
    required this.name,
    required this.email,
    required this.password,
  });
}

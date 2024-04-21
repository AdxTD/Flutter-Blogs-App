import 'package:blog_app/core/common/entities/user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;

  AuthBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSignUp(SignUpData(
          name: event.name, email: event.email, password: event.password));
      res.fold(
        //(l) => null, (r) => null)
        (failure) => emit(AuthFailure(failure.message)),
        (user) => emit(AuthSuccess(user)),
      );
    });
  }
}

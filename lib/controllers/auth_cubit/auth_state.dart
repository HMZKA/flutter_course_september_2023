part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  LoginSuccessState({required this.status});
  bool status;
}

class LoginErrorState extends AuthState {}

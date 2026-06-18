import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());
  bool securePassword = true;
  bool isChecked = false;
  void changePasswordVisibility() {
    securePassword = !securePassword;
    emit(PasswordVisibilityState());
  }

  void changeCheckState({required bool value}) {
    if (isChecked == value) return;
    isChecked = value;
    emit(CheckPrivacyState());
  }
}

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class PasswordVisibilityState extends AuthState {}

class CheckPrivacyState extends AuthState {}

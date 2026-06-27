import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medical_clinic/features/auth/data/models/register_request.dart';
import 'package:medical_clinic/features/auth/domain/use_cases/register_use_case.dart';
@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.registerUseCase}) : super(AuthInitialState());
  RegisterUseCase registerUseCase;
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

  Future<void> register({required RegisterRequest request}) async {
    emit(RegisterLoadingState());
    final result = await registerUseCase(request: request);
    result.fold(
      (error) {
        emit(RegisterFailureState(message: error.message));
      },
      (_) {
        emit(RegisterSuccessState());
      },
    );
  }
}

abstract class AuthState {}

class AuthInitialState extends AuthState {}

class PasswordVisibilityState extends AuthState {}

class CheckPrivacyState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterFailureState extends AuthState {
  String message;
  RegisterFailureState({required this.message});
}

class RegisterSuccessState extends AuthState {}

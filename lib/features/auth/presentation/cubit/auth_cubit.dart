import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medical_clinic/features/auth/data/models/login_request.dart';
import 'package:medical_clinic/features/auth/data/models/register_request.dart';
import 'package:medical_clinic/features/auth/data/models/user.dart';
import 'package:medical_clinic/features/auth/domain/use_cases/add_user_to_firestore_use_case.dart';
import 'package:medical_clinic/features/auth/domain/use_cases/login_use_case.dart';
import 'package:medical_clinic/features/auth/domain/use_cases/register_use_case.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.registerUseCase,
    required this.loginUseCase,
    required this.addUserToFirestoreUseCase,
  }) : super(AuthInitialState());
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;
  AddUserToFirestoreUseCase addUserToFirestoreUseCase;
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
      (credential) async {
        final userModel = UserModel(
          id: credential.user!.uid,
          name: request.name,
          email: request.email,
          password: request.password,
          phone: request.phone,
        );
        final result = await addUserToFirestoreUseCase(user: userModel);
        result.fold(
          (failure) => emit(RegisterFailureState(message: failure.message)),
          (_) {
            UserModel.currentUser = userModel;
            emit(RegisterSuccessState());
          },
        );
      },
    );
  }

  Future<void> login({required LoginRequest request}) async {
    emit(LoginLoadingState());
    final result = await loginUseCase(request: request);
    result.fold(
      (error) {
        emit(LoginFailureState(message: error.message));
      },
      (_) {
        emit(LoginSuccessState());
      },
    );
  }

  void resetAuthState() {
    emit(AuthInitialState());
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

class LoginLoadingState extends AuthState {}

class LoginFailureState extends AuthState {
  String message;
  LoginFailureState({required this.message});
}

class LoginSuccessState extends AuthState {}

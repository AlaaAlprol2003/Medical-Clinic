import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medical_clinic/core/errors/failure.dart';
import 'package:medical_clinic/features/auth/data/models/login_request.dart';
import 'package:medical_clinic/features/auth/domain/repository/auth_repository.dart';

@singleton
class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failure, void>> call({required LoginRequest request}) {
    return authRepository.login(request: request);
  }
}
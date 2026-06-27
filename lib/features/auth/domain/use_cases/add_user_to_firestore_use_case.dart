import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:medical_clinic/core/errors/failure.dart';
import 'package:medical_clinic/features/auth/data/models/user.dart';
import 'package:medical_clinic/features/auth/domain/repository/auth_repository.dart';

@singleton
class AddUserToFirestoreUseCase {
  AuthRepository authRepository;
  AddUserToFirestoreUseCase({required this.authRepository});

  Future<Either<Failure, void>> call({required UserModel user}) {
    return authRepository.addUserToFirestore(user: user);
  }
}
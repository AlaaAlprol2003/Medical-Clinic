import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:medical_clinic/core/errors/app_exceptions.dart';
import 'package:medical_clinic/core/errors/failure.dart';
import 'package:medical_clinic/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:medical_clinic/features/auth/data/models/login_request.dart';
import 'package:medical_clinic/features/auth/data/models/register_request.dart';
import 'package:medical_clinic/features/auth/data/models/user.dart';
import 'package:medical_clinic/features/auth/domain/repository/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserCredential>> register({
    required RegisterRequest request,
  }) async {
    try {
     UserCredential credential =  await remoteDataSource.register(request: request);
      return right(credential);
    } on RemoteException catch (ex) {
      return left(Failure(message: ex.message));
    }
  }

  @override
  Future<Either<Failure, void>> login({required LoginRequest request}) async {
    try {
      await remoteDataSource.login(request: request);
      return right(null);
    } on RemoteException catch (ex) {
      return left(Failure(message: ex.message));
    }
  }

  @override
  Future<Either<Failure, void>> addUserToFirestore({
    required UserModel user,
  }) async {
    try {
      await remoteDataSource.addUserToFirestore(user: user);
      return Right(null);
    } on RemoteException catch (_) {
      return Left(Failure(message: "Failed to save user"));
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_clinic/core/errors/failure.dart';
import 'package:medical_clinic/features/auth/data/models/login_request.dart';
import 'package:medical_clinic/features/auth/data/models/register_request.dart';
import 'package:medical_clinic/features/auth/data/models/user.dart';

abstract class AuthRepository {
  Future<Either<Failure,UserCredential>> register({required RegisterRequest request});
  Future<Either<Failure,void>> login({required LoginRequest request});
  Future<Either<Failure, void>> addUserToFirestore({required UserModel user});
}

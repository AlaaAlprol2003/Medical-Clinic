import 'package:dartz/dartz.dart';
import 'package:medical_clinic/core/errors/failure.dart';
import 'package:medical_clinic/features/auth/data/models/register_request.dart';

abstract class AuthRepository {
  Future<Either<Failure,void>> register({required RegisterRequest request});
}

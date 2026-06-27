import 'package:firebase_auth/firebase_auth.dart';
import 'package:medical_clinic/features/auth/data/models/login_request.dart';
import 'package:medical_clinic/features/auth/data/models/register_request.dart';
import 'package:medical_clinic/features/auth/data/models/user.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> register({required RegisterRequest request});
  Future<void> login({required LoginRequest request});
  Future<void> addUserToFirestore({required UserModel user});
}

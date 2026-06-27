import 'package:medical_clinic/features/auth/data/models/register_request.dart';

abstract class AuthRemoteDataSource {
  Future<void> register({required RegisterRequest request});
}

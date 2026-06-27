import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:medical_clinic/core/errors/app_exceptions.dart';
import 'package:medical_clinic/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:medical_clinic/features/auth/data/models/login_request.dart';
import 'package:medical_clinic/features/auth/data/models/register_request.dart';
import 'package:medical_clinic/features/auth/data/models/user.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthFirebaseRemoteDataSource implements AuthRemoteDataSource {
  @override
  Future<UserCredential> register({required RegisterRequest request}) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: request.email,
            password: request.password,
          );
      return credential;
    } on FirebaseAuthException catch (ex) {
      print(ex.toString());
      throw RemoteException(message: ex.message ?? "حدث خطأ في المصادقة");
    } catch (ex) {
      print(ex.toString());
      throw RemoteException(message: "حدث خطأ غير متوقع، يرجى المحاولة لاحقاً");
    }
  }

  @override
  Future<void> login({required LoginRequest request}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );
    } on FirebaseAuthException catch (ex) {
      throw RemoteException(message: ex.message ?? "حدث خطأ في المصادقة");
    } catch (ex) {
      throw RemoteException(message: "حدث خطأ غير متوقع، يرجى المحاولة لاحقاً");
    }
  }

  @override
  Future<void> addUserToFirestore({required UserModel user}) async {
    try {
      FirebaseFirestore db = FirebaseFirestore.instance;
      CollectionReference<Map<String, dynamic>> usersCollection = db.collection(
        "Users",
      );
      DocumentReference<Map<String, dynamic>> userDocument = usersCollection
          .doc(user.id);

      await userDocument.set(user.toJson());
    } catch (exception) {
      throw RemoteException(message: exception.toString());
    }
  }
}

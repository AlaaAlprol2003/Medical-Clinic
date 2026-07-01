import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../model/booking_model.dart';


abstract class AppointmentRemoteDataSource {
  Future<void> bookAppointment(
      AppointmentModel appointment,
      );

  Future<List<String>> getAvailableTimes(
      String date,
      );

  Future<List<AppointmentModel>> getAppointments();
}
@Injectable(
  as: AppointmentRemoteDataSource,
)

class AppointmentRemoteDataSourceImpl
    implements AppointmentRemoteDataSource {

  final FirebaseFirestore firestore;

  AppointmentRemoteDataSourceImpl(this.firestore);

  @override
  Future<void> bookAppointment(
      AppointmentModel appointment,
      ) async {
    await firestore
        .collection('appointments')
        .doc(appointment.id)
        .set(appointment.toJson());
  }

  @override
  Future<List<AppointmentModel>> getAppointments() async {
    final snapshot =
    await firestore.collection('appointments').get();

    return snapshot.docs.map((doc) {
      return AppointmentModel.fromJson(
        doc.data(),
        doc.id,
      );
    }).toList();
  }

  @override
  Future<List<String>> getAvailableTimes(
      String date,
      ) async {
    final snapshot = await firestore
        .collection('appointments')
        .where('date', isEqualTo: date)
        .get();

    final bookedTimes = snapshot.docs
        .map((e) => e['time'] as String)
        .toList();

    final allTimes = [
      '4:00',
      '4:30',
      '5:00',
      '5:30',
      '6:00',
      '6:30',
      '7:00',
      '7:30',
      '8:00',
    ];

    return allTimes
        .where((time) => !bookedTimes.contains(time))
        .toList();
  }
}
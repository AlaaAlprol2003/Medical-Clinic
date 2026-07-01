


import 'package:injectable/injectable.dart';

import '../../domain/entities/booking_entity.dart';
import '../../domain/repositories/booking_repository.dart';
import '../data_source/booking_remote_data_source.dart';
import '../model/booking_model.dart';
@Injectable(as: AppointmentRepository)
class AppointmentRepositoryImpl
    implements AppointmentRepository {

  final AppointmentRemoteDataSource remote;

  AppointmentRepositoryImpl(this.remote);

  @override
  Future<void> bookAppointment(
      AppointmentEntity appointment,
      ) {
    return remote.bookAppointment(
      AppointmentModel(
        id: appointment.id,
        patientName: appointment.patientName,
        phone: appointment.phone,
        appointmentType: appointment.appointmentType,
        date: appointment.date,
        time: appointment.time, price: appointment.price,
      ),
    );
  }

  @override
  Future<List<AppointmentEntity>> getAppointments() {
    return remote.getAppointments();
  }

  @override
  Future<List<String>> getAvailableTimes(
      String date,
      ) {
    return remote.getAvailableTimes(date);
  }
}
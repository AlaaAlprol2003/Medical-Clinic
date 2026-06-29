
import '../entities/booking_entity.dart';

abstract class AppointmentRepository {
  Future<void> bookAppointment(
      AppointmentEntity appointment,
      );

  Future<List<String>> getAvailableTimes(
      String date,
      );

  Future<List<AppointmentEntity>> getAppointments();
}
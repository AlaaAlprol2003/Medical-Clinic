

import 'package:injectable/injectable.dart';

import '../entities/booking_entity.dart';
import '../repositories/booking_repository.dart';
@injectable
class BookingUseCase {
  final AppointmentRepository repository;

  BookingUseCase(this.repository);

  Future<void> call(
      AppointmentEntity appointment,
      ) {
    return repository.bookAppointment(
      appointment,
    );
  }
}
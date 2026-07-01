import 'package:injectable/injectable.dart';

import '../repositories/booking_repository.dart';
@injectable
class GetAvailableTimesUseCase {
  final AppointmentRepository repository;

  GetAvailableTimesUseCase(this.repository);

  Future<List<String>> call(
      String date,
      ) {
    return repository.getAvailableTimes(date);
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:medical_clinic/features/booking/domain/use_cases/booking_usecase.dart';

import '../../domain/entities/booking_entity.dart';
import '../../domain/use_cases/get_available_times.dart';
import 'booking_state.dart';

@injectable
class AppointmentCubit
    extends Cubit<AppointmentState> {

  final BookingUseCase bookingUseCase;
  final GetAvailableTimesUseCase getAvailableTimesUseCase;

  AppointmentCubit(
      this.bookingUseCase,
      this.getAvailableTimesUseCase,
      ) : super(AppointmentInitial());

  Future<void> getAvailableTimes(
      String date,
      ) async {
    emit(AppointmentLoading());

    try {
      final times =
      await getAvailableTimesUseCase(date);

      emit(
        AvailableTimesLoaded(times),
      );
    } catch (e) {
      emit(
        AppointmentError(e.toString()),
      );
    }
  }

  Future<void> bookAppointment(
      AppointmentEntity appointment,
      ) async {
    emit(AppointmentLoading());

    try {
      await bookingUseCase(
        appointment,
      );

      emit(AppointmentBooked());
    } catch (e) {
      emit(
        AppointmentError(e.toString()),
      );
    }
  }
}
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/booking_entity.dart';
import '../../domain/use_cases/booking_usecase.dart';
import '../../domain/use_cases/get_available_times.dart';
import 'booking_state.dart';

@injectable
class AppointmentCubit extends Cubit<AppointmentState> {
  final BookingUseCase bookingUseCase;
  final GetAvailableTimesUseCase getAvailableTimesUseCase;

  AppointmentCubit(
      this.bookingUseCase,
      this.getAvailableTimesUseCase,
      ) : super(AppointmentInitial());

  String? selectedVisitType;
  DateTime? selectedDay;
  String? selectedTime;

  double selectedPrice = 0;

  List<String> availableTimes = [];

  void changeVisitType(String? value) {
    selectedVisitType = value;

    switch (value) {
      case 'كشف كبار':
        selectedPrice = 220;
        break;

      case 'كشف أطفال':
        selectedPrice = 250;
        break;

      case 'إعادة':
        selectedPrice = 70;
        break;

      default:
        selectedPrice = 0;
    }

    emit(AppointmentDataChanged());
  }

  Future<void> selectDay(DateTime day) async {
    selectedDay = day;
    selectedTime = null;

    emit(AppointmentLoading());

    try {
      final date =
          '${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';

      availableTimes =
      await getAvailableTimesUseCase(date);

      emit(AvailableTimesLoaded(availableTimes));
    } catch (e) {
      emit(AppointmentError(e.toString()));
    }
  }

  void selectTime(String? time) {
    selectedTime = time;

    emit(AppointmentDataChanged());
  }

  Future<void> bookAppointment(
      AppointmentEntity appointment) async {
    emit(AppointmentLoading());

    try {
      await bookingUseCase(appointment);

      emit(AppointmentBooked());
    } catch (e) {
      emit(AppointmentError(e.toString()));
    }
  }

  void resetBooking() {
    selectedVisitType = null;
    selectedDay = null;
    selectedTime = null;

    selectedPrice = 0;
    availableTimes = [];

    emit(AppointmentInitial());
  }
}
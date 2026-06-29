abstract class AppointmentState {}

class AppointmentInitial
    extends AppointmentState {}

class AppointmentLoading
    extends AppointmentState {}

class AvailableTimesLoaded
    extends AppointmentState {
  final List<String> times;

  AvailableTimesLoaded(
      this.times,
      );
}

class AppointmentBooked
    extends AppointmentState {}

class AppointmentError
    extends AppointmentState {
  final String message;

  AppointmentError(
      this.message,
      );
}
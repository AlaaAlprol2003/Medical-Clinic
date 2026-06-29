class AppointmentEntity {
  final String id;
  final String patientName;
  final String phone;
  final String appointmentType;
  final String date;
  final String time;

  const AppointmentEntity({
     required this.id,
    required this.patientName,
    required this.phone,
    required this.appointmentType,
    required this.date,
    required this.time,
  });
}
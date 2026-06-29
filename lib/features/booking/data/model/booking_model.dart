
import '../../domain/entities/booking_entity.dart';

class AppointmentModel extends AppointmentEntity {
  const AppointmentModel({
    required super.id,
    required super.patientName,
    required super.phone,
    required super.appointmentType,
    required super.date,
    required super.time,
  });

  factory AppointmentModel.fromJson(
      Map<String, dynamic> json,
      String id,
      ) {
    return AppointmentModel(
      id: id,
      patientName: json['patientName'],
      phone: json['phone'],
      appointmentType: json['appointmentType'],
      date: json['date'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'patientName': patientName,
      'phone': phone,
      'appointmentType': appointmentType,
      'date': date,
      'time': time,
    };
  }
}
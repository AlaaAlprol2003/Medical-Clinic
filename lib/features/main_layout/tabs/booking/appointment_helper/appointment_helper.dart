import 'package:flutter/material.dart';

class AppointmentHelper {

  static List<DateTime> getAvailableDays() {
    final now = DateTime.now();
    final List<DateTime> availableDays = [];

    for (int i = 0; i < 30; i++) {
      final date = now.add(Duration(days: i));

      if (date.weekday == DateTime.thursday ||
          date.weekday == DateTime.saturday ||
          date.weekday == DateTime.sunday) {
        availableDays.add(date);
      }
    }

    return availableDays;
  }


  static String getArabicDayName(DateTime date) {
    switch (date.weekday) {
      case DateTime.thursday:
        return 'الخميس';
      case DateTime.saturday:
        return 'السبت';
      case DateTime.sunday:
        return 'الأحد';
      default:
        return '';
    }
  }


  static List<String> getAvailableTimes() {
    List<String> times = [];

    for (int hour = 16; hour < 20; hour++) {
      times.add(_formatTime(hour, 0));
      times.add(_formatTime(hour, 30));
    }

    times.add(_formatTime(20, 0));

    return times;
  }

  static String _formatTime(int hour, int minute) {
    final period = hour >= 12 ? 'م' : 'ص';
    final displayHour = hour > 12 ? hour - 12 : hour;

    return '${displayHour}:${minute.toString().padLeft(2, '0')} $period';
  }
}
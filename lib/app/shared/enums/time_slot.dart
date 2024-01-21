import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/shared/utils/misc.dart';

enum TimeSlot { breakfast, lunch, dinner }

TimeSlot getTimeSlot(String timeSlot) {
  timeSlot = timeSlot.toLowerCase();
  if (timeSlot == TimeSlot.breakfast.name) return TimeSlot.breakfast;
  if (timeSlot == TimeSlot.lunch.name) return TimeSlot.lunch;
  if (timeSlot == TimeSlot.dinner.name) return TimeSlot.dinner;
  throw Exception("No Time slot: $timeSlot found");
}

extension TimeSlotExtension on TimeSlot {
  static List<TimeSlot> getUpcomingSlots() {
    if (isDisabledTime(timeSlots[TimeSlot.dinner]!.last)) {
      return [];
    }
    if (isDisabledTime(timeSlots[TimeSlot.lunch]!.last)) {
      return [TimeSlot.dinner];
    }
    if (isDisabledTime(timeSlots[TimeSlot.breakfast]!.last)) {
      return [TimeSlot.lunch, TimeSlot.dinner];
    }
    return TimeSlot.values;
  }
}

extension TimeOfDayExtension on TimeOfDay {
  double toDouble() => hour + minute / 60.0;
  bool isLessThan(TimeOfDay other) => toDouble() < other.toDouble();
  bool isEqualTo(TimeOfDay other) => toDouble() == other.toDouble();
  bool isGreaterThan(TimeOfDay other) => toDouble() > other.toDouble();

  TimeOfDay add({int hh = 0, int mm = 0}) {
    int newMinute = minute + mm;
    int newHour = hour + hh + (newMinute ~/ 60);
    if (newHour > 23) {
      throw Exception("Error: hour $newHour not valid");
    }
    newMinute = newMinute % 60;
    return replacing(hour: newHour, minute: newMinute);
  }
}

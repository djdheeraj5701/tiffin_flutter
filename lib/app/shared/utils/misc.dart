import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/shared/enums/time_slot.dart';

redirectToPreviousPage(BuildContext currContext) async {
  Navigator.of(currContext).pop();
}

Map<TimeSlot, List<TimeOfDay>> timeSlots = {
  TimeSlot.breakfast: [
    [08, 00],
    [08, 30],
    [09, 00],
    [09, 30],
    [10, 00],
    [10, 30]
  ].map((time) => TimeOfDay(hour: time[0], minute: time[1])).toList(),
  TimeSlot.lunch: [
    [12, 30],
    [13, 00],
    [13, 30],
    [14, 00],
    [14, 30],
    [15, 00]
  ].map((time) => TimeOfDay(hour: time[0], minute: time[1])).toList(),
  TimeSlot.dinner: [
    [18, 30],
    [19, 00],
    [19, 30],
    [20, 00],
    [20, 30],
    [21, 00]
  ].map((time) => TimeOfDay(hour: time[0], minute: time[1])).toList(),
};

String getformattedtime(TimeOfDay time) {
  return '${time.hour == 12 ? 12 : time.hour % 12}:${time.minute.toString().padLeft(2, '0')} ${time.period.toString().split('.')[1]}';
}

extension StringExtension on String {
  String toTitleCase() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

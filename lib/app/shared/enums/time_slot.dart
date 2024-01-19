enum TimeSlot { breakfast, lunch, dinner }

TimeSlot getTimeSlot(String timeSlot) {
  timeSlot = timeSlot.toLowerCase();
  if (timeSlot == TimeSlot.breakfast.name) return TimeSlot.breakfast;
  if (timeSlot == TimeSlot.lunch.name) return TimeSlot.lunch;
  if (timeSlot == TimeSlot.dinner.name) return TimeSlot.dinner;
  throw Exception("No Time slot: $timeSlot found");
}

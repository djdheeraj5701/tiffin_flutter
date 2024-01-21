import 'package:flutter/material.dart';
import 'package:tiffin_flutter/app/shared/enums/time_slot.dart';
import 'package:tiffin_flutter/app/shared/utils/misc.dart';
import 'package:tiffin_flutter/global-styles/tiffin_app_theme.dart';

class TimeSlotCard extends StatefulWidget {
  const TimeSlotCard({super.key});

  @override
  State<TimeSlotCard> createState() => _TimeSlotCardState();
}

class _TimeSlotCardState extends State<TimeSlotCard> {
  List<TimeSlot> availableTimeSlots = TimeSlotExtension.getUpcomingSlots();
  String? selectedTimeSlot = TimeSlotExtension.getUpcomingSlots().isNotEmpty
      ? TimeSlotExtension.getUpcomingSlots().first.name.toTitleCase()
      : null;
  TimeOfDay? selectedTimeOfDay;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.grey.shade100,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Timeslot",
                    style: TiffinAppTheme.headingSmallTextStyle,
                  ),
                  DropdownButton(
                      value: selectedTimeSlot,
                      icon: null,
                      dropdownColor: TiffinAppTheme.primaryTints[100],
                      items: TimeSlotExtension.getUpcomingSlots()
                          .map((timeSlot) => DropdownMenuItem(
                                value: timeSlot.name.toTitleCase(),
                                child: Text(timeSlot.name.toTitleCase()),
                              ))
                          .toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedTimeSlot = newValue!;
                          selectedTimeOfDay = null;
                        });
                      })
                ],
              ),
              availableTimeSlots.isNotEmpty
                  ? Wrap(
                      spacing: 5.0,
                      children: timeSlots[getTimeSlot(selectedTimeSlot!)]!
                          .map((timeOfDayOption) => ChoiceChip(
                                showCheckmark: false,
                                side: selectedTimeOfDay == timeOfDayOption
                                    ? const BorderSide(
                                        width: 1,
                                        color: TiffinAppTheme.primaryColor)
                                    : const BorderSide(),
                                selectedColor: TiffinAppTheme.primaryTints[100],
                                label: Text(
                                  getformattedtime(timeOfDayOption),
                                ),
                                backgroundColor: isDisabledTime(timeOfDayOption)
                                    ? Colors.grey.shade300
                                    : Colors.white,
                                pressElevation:
                                    isDisabledTime(timeOfDayOption) ? 0 : 4,
                                elevation:
                                    isDisabledTime(timeOfDayOption) ? 0 : 4,
                                selected: selectedTimeOfDay == timeOfDayOption,
                                onSelected: (isSelected) {
                                  setState(() {
                                    if (isDisabledTime(timeOfDayOption)) return;
                                    if (isSelected) {
                                      selectedTimeOfDay = timeOfDayOption;
                                    } else if (selectedTimeOfDay ==
                                        timeOfDayOption) {
                                      selectedTimeOfDay = null;
                                    }
                                  });
                                },
                              ))
                          .toList())
                  : Container(
                      child: Text("No Time Slots"),
                    ),
            ]),
          )),
    );
  }
}

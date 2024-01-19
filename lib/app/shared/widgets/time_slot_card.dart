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
  String selectedTimeSlot = "Breakfast";
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
            padding: const EdgeInsets.all(8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Time Slot",
                    style: TiffinAppTheme.headingSmallTextStyle,
                  ),
                  DropdownButton(
                      value: selectedTimeSlot,
                      icon: null,
                      dropdownColor: TiffinAppTheme.primaryTints[100],
                      items: TimeSlot.values
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
              Wrap(
                  spacing: 5.0,
                  children: timeSlots[getTimeSlot(selectedTimeSlot)]!
                      .map((timeOfDay) => ChoiceChip(
                            showCheckmark: false,
                            side: selectedTimeOfDay == timeOfDay
                                ? const BorderSide(
                                    width: 1,
                                    color: TiffinAppTheme.primaryColor)
                                : BorderSide.none,
                            selectedColor: TiffinAppTheme.primaryTints[100],
                            label: Text(
                              getformattedtime(timeOfDay),
                            ),
                            selected: selectedTimeOfDay == timeOfDay,
                            onSelected: (isSelected) {
                              setState(() {
                                if (isSelected) {
                                  selectedTimeOfDay = timeOfDay;
                                } else if (selectedTimeOfDay == timeOfDay) {
                                  selectedTimeOfDay = null;
                                }
                              });
                            },
                          ))
                      .toList()),
            ]),
          )),
    );
  }
}

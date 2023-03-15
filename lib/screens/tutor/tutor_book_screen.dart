import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TutorBookingScreen extends StatefulWidget {
  const TutorBookingScreen({super.key});

  @override
  State<TutorBookingScreen> createState() => _TutorBookingScreenState();
}

class _TutorBookingScreenState extends State<TutorBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: SfCalendar(
            onTap: (calendarTapDetails) {
              if (calendarTapDetails.targetElement ==
                  CalendarElement.appointment) {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Booking detail'),
                    content: const Text('Book this lesson?'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Book'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
            dataSource: _getCalendarDataSource(),
            showDatePickerButton: true,
            view: CalendarView.week,
            timeSlotViewSettings: const TimeSlotViewSettings(
                startHour: 8, endHour: 22, timeInterval: Duration(minutes: 45)),
          ),
        ));
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];

  appointments.add(Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(const Duration(hours: 1)),
    subject: 'Meeting',
    color: Colors.blue,
  ));

  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

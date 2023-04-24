import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../services/schedule_booking_service.dart';
import '../../utils/extension_methods/datetime_extension_methods.dart';
import 'components/booking_dialog.dart';

class TutorBookingScreen extends ConsumerStatefulWidget {
  final String tutorId;
  const TutorBookingScreen({super.key, required this.tutorId});

  @override
  ConsumerState<TutorBookingScreen> createState() => _TutorBookingScreenState();
}

class _TutorBookingScreenState extends ConsumerState<TutorBookingScreen> {
  late final ScheduleBookingService _service;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service = ref.read(scheduleBookingService);
    _service.getTableSchedules(widget.tutorId);
  }

  Widget _onBuildAppointment(
      BuildContext context, CalendarAppointmentDetails details) {
    final Appointment appointment = details.appointments.first;
    final data = _service.findSchedule(appointment.id as String);
    if (data == null) return Container();
    return Container(
      width: details.bounds.width,
      decoration: BoxDecoration(
          color: appointment.color,
          borderRadius: const BorderRadius.all(Radius.circular(6))),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            appointment.subject,
            style: TextStyle(
                color: data.isBooked
                    ? _service.isBookedByOther(data)
                        ? Colors.grey
                        : Colors.green
                    : Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final listData = ref.watch(scheduleBookingService).schedules;
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: listData == null
              ? const Center(child: CircularProgressIndicator())
              : SfCalendar(
                  minDate: DateTimeExtension.getBeginningOfToday(),
                  appointmentBuilder: _onBuildAppointment,
                  onTap: (calendarTapDetails) {
                    if (calendarTapDetails.targetElement ==
                        CalendarElement.appointment) {
                      Appointment appointment =
                          calendarTapDetails.appointments!.first;
                      final detail =
                          _service.findSchedule(appointment.id as String);
                      if (detail == null || detail.isBooked) {
                        return;
                      }
                      bookingPopup(
                          context,
                          DateTime.fromMillisecondsSinceEpoch(
                              detail.startPeriodTimestamp),
                          DateTime.fromMillisecondsSinceEpoch(
                              detail.endPeriodTimestamp),
                          (note) => _handleBook(detail.id, note));
                    }
                  },
                  dataSource: _getCalendarDataSource(),
                  showDatePickerButton: true,
                  view: CalendarView.week,
                  timeSlotViewSettings: const TimeSlotViewSettings(
                      timeFormat: 'HH:mm',
                      startHour: 8,
                      endHour: 23,
                      timeInterval: Duration(minutes: 30)),
                ),
        ));
  }

  CalendarDataSource _getCalendarDataSource() {
    final listData = _service.schedules!;
    List<Appointment> appointments = <Appointment>[];

    for (final data in listData) {
      for (final detail in data.scheduleDetails) {
        appointments.add(
          Appointment(
            id: detail.id,
            startTime: DateTime.fromMillisecondsSinceEpoch(
                detail.startPeriodTimestamp),
            endTime:
                DateTime.fromMillisecondsSinceEpoch(detail.endPeriodTimestamp),
            subject: detail.isBooked
                ? _service.isBookedByOther(detail)
                    ? 'Reserved'
                    : 'Booked'
                : 'Book',
            color: detail.isBooked ? Colors.transparent : Colors.blue,
          ),
        );
      }
    }

    return _AppointmentDataSource(appointments);
  }

  Future<void> _handleBook(String id, String? note) async {
    bool result = await _service.bookSchedule(id, note);
    //TODO pop success
    if (context.mounted) successPopup(context);
    _service.getTableSchedules(widget.tutorId);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

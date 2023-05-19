import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_english/screens/schedule_screen/schedule_screen.dart';
import 'package:online_english/utils/extension_methods/datetime_extension_methods.dart';

import '../../../utils/theme/my_theme.dart';

Future successPopup(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(
        'Booking details',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      content: SizedBox(
        height: 200,
        child: Center(
          child: Column(
            children: [
              const Text('Booked Successfully'),
              OutlinedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScheduleScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.calendar_month),
                label: const Text('Your schedule'),
                style: MyTheme.outlineButtonStyle.copyWith(
                    minimumSize: const MaterialStatePropertyAll(Size(30, 30))),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Book');
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

Future bookingPopup(BuildContext context, DateTime startDate, DateTime endDate,
    Function(String?)? onConfirm) {
  final dateFormat = DateFormat('EEEE, d MMMM y');
  final timeFormat = DateFormat('hh:m');
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => BookingDialog(
      detailTime:
          '${startDate.format(timeFormat)} - ${endDate.format(timeFormat)} ${startDate.format(dateFormat)}',
      onConfirm: onConfirm,
    ),
  );
}

class BookingDialog extends StatefulWidget {
  const BookingDialog({
    super.key,
    required this.detailTime,
    this.onConfirm,
  });
  final String detailTime;
  final Function(String?)? onConfirm;
  @override
  State<BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  // for this example, it's safe to instantiate the controller inline
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Booking details',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      content: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Time',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              subtitle: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  widget.detailTime,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            Card(
              elevation: 0,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  maxLines: 6,
                  decoration: const InputDecoration.collapsed(
                    hintText:
                        '(optional) Add your note for this meeting, e.g. learn English',
                  ),
                  controller: _controller,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Book this lesson?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Cancel');
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            widget.onConfirm
                ?.call(_controller.text.isEmpty ? null : _controller.text);
            Navigator.pop(context, 'Book');
          },
          child: const Text('Book'),
        ),
      ],
    );
  }
}

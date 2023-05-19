import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_english/utils/extension_methods/datetime_extension_methods.dart';

import '../../../data/model/schedule_model/upcoming_schedule_model/cancel_reason_model.dart';

Future resultPopup(BuildContext context, String title, String content) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      content: SizedBox(
        height: 100,
        child: Center(
          child: FittedBox(fit: BoxFit.fitWidth, child: Text(content)),
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

Future cancelPopup(BuildContext context, DateTime startDate, DateTime endDate,
    List<CancelReasonModel> cancelReasons, Function(int, String?)? onConfirm) {
  final dateFormat = DateFormat('EEEE, d MMMM y');
  final timeFormat = DateFormat('hh:m');
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => CancelDialog(
      detailTime:
          '${startDate.format(timeFormat)} - ${endDate.format(timeFormat)} ${startDate.format(dateFormat)}',
      onConfirm: onConfirm,
      cancelReasons: cancelReasons,
    ),
  );
}

class CancelDialog extends StatefulWidget {
  const CancelDialog({
    super.key,
    required this.detailTime,
    this.onConfirm,
    required this.cancelReasons,
  });
  final List<CancelReasonModel> cancelReasons;
  final String detailTime;
  final Function(int, String?)? onConfirm;
  @override
  State<CancelDialog> createState() => _CancelDialogState();
}

class _CancelDialogState extends State<CancelDialog> {
  // for this example, it's safe to instantiate the controller inline
  final TextEditingController _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? selectedReasonId;
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
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                widget.detailTime,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const Divider(),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: DropdownButtonFormField<int>(
                value: selectedReasonId,
                hint: const Text('Choose a reason'),
                onChanged: (salutation) =>
                    setState(() => selectedReasonId = salutation),
                validator: (value) => value == null ? 'field required' : null,
                items: widget.cancelReasons.map<DropdownMenuItem<int>>((value) {
                  return DropdownMenuItem<int>(
                    value: value.id,
                    child: Text(value.reason),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 0,
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  maxLines: 4,
                  decoration: const InputDecoration.collapsed(
                    hintText: '(optional) Additional note',
                  ),
                  controller: _controller,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Delete this lesson ?'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (selectedReasonId == null) return;
            String? additionalNote =
                _controller.text.isEmpty ? null : _controller.text;
            widget.onConfirm?.call(selectedReasonId!, additionalNote);
            Navigator.pop(context);
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

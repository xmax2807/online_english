import 'dart:async';
import 'package:flutter/material.dart';

class CountdownWidget extends StatefulWidget {
  final String labelText;
  final Color? color;
  final int destinationTimestamp;
  const CountdownWidget(
      {super.key,
      required this.labelText,
      this.color,
      required this.destinationTimestamp});

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Timer _timer;
  Duration _duration = const Duration();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  void _timerCallback(Timer timer) {
    final int seconds = _duration.inSeconds - 1;

    if (seconds == 0) {
      setState(() {
        timer.cancel();
      });
    } else {
      setState(() {
        _duration = Duration(seconds: seconds);
      });
    }
  }

  void startTimer() {
    _duration = DateTime.fromMillisecondsSinceEpoch(widget.destinationTimestamp)
        .difference(DateTime.now());
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, _timerCallback);
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(_duration.inDays);

    final hours = strDigits(_duration.inHours.remainder(24));
    final minutes = strDigits(_duration.inMinutes.remainder(60));
    final seconds = strDigits(_duration.inSeconds.remainder(60));
    return Text(
      "${widget.labelText}$hours:$minutes:$seconds",
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(color: widget.color),
    );
  }
}

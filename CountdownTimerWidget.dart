// Code by AlfaWhoCodes
// Follow for more on Instagram @alfawhocodes

import 'dart:async';

import 'package:flutter/material.dart';

class CountdownTimerWidget extends StatefulWidget {
  CountdownTimerWidget({Key? key}) : super(key: key);

  @override
  State<CountdownTimerWidget> createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  static var timerDuration = Duration(minutes: 10);
  static var countdownDuration1 = Duration(minutes: 10);
  Duration duration = Duration();
  Duration duration1 = Duration();
  Timer? timer;
  Timer? timer1;
  bool countDown = true;
  bool countDown1 = true;

  @override
  void initState() {
    timerDuration = Duration(hours: 0, minutes: 0, seconds: 0);
    startTimer();
    reset();

    countdownDuration1 = Duration(hours: 0, minutes: 2, seconds: 50);
    startTimer1();
    reset1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 238, 238, 238),
        width: double.infinity,
        child: ListView(physics: BouncingScrollPhysics(), children: [
          const SizedBox(
            height: 64,
          ),
          const Spacer(),
          const Center(
            child: Text(
              "Timer",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 12, bottom: 64),
                child: timerWidget()),
          ),
          const SizedBox(
            height: 8,
          ),
          const Center(
            child: Text(
              "Count Down Timer",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black54,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 16, bottom: 64),
                child: countdownTimer()),
          ),
          Spacer(),
          Center(
            child: Container(
                padding: EdgeInsets.only(top: 24, bottom: 4),
                child: const Text('AlfaWhoCodes',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600))),
          ),
          Center(
            child: Container(
                child: const Text('follow for more',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.w300))),
          ),
          const SizedBox(
            height: 24,
          ),
        ]),
      ),
    );
  }

  void reset() {
    if (countDown) {
      setState(() => duration = timerDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void reset1() {
    if (countDown) {
      setState(() => duration1 = countdownDuration1);
    } else {
      setState(() => duration1 = Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void startTimer1() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime1());
  }

  void addTime() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void addTime1() {
    final addSeconds = 1;
    setState(() {
      final seconds = duration1.inSeconds - addSeconds;
      if (seconds < 0) {
        timer1?.cancel();
      } else {
        duration1 = Duration(seconds: seconds);
      }
    });
  }

  Widget timerWidget() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          timeCard(time: hours, header: 'Hours'),
          timeColon(),
          timeCard(time: minutes, header: 'Minutes'),
          timeColon(),
          timeCard(time: seconds, header: 'Seconds'),
        ]);
  }

  Widget countdownTimer() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration1.inHours);
    final minutes = twoDigits(duration1.inMinutes.remainder(60));
    final seconds = twoDigits(duration1.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      timeCard(time: hours, header: 'Hours'),
      timeColon(),
      timeCard(time: minutes, header: 'Minutes'),
      timeColon(),
      timeCard(time: seconds, header: 'Seconds'),
    ]);
  }

  Widget timeCard({required String time, required String header}) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 78,
            height: 68,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Color.fromARGB(213, 132, 26, 231),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(235, 251, 247, 255),
                  fontSize: 32),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(header, style: TextStyle(color: Colors.black45)),
        ],
      );

  Widget timeColon() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(),
            child: const Text(
              ':',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(213, 132, 26, 231),
                  fontSize: 36),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text('', style: TextStyle(color: Colors.black45)),
        ],
      );
}

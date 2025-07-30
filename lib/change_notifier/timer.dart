
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  DateTime? endTime;
  bool isTimerStarted = false;

  void startTimer() {
    setState(() {
      endTime = DateTime.now().add(Duration(minutes: 10));
      isTimerStarted = true;
    });
  }

  void pushTimer() {
    setState(() {
      isTimerStarted = false;
      endTime = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Startable Timer",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black26,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isTimerStarted && endTime != null)
              TimerCountdown(
                timeTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                format: CountDownTimerFormat.minutesSeconds,
                endTime: endTime!,
                onEnd: () {
                  print("Timer finished");
                },
              )
            else
              Text("Press the button to start the timer"),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: isTimerStarted ? null : startTimer,
                  child: Text("Start Timer"),
                ),
                ElevatedButton(
                  onPressed: () {
                    pushTimer;
                  },
                  child: Text("Stop Timer"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

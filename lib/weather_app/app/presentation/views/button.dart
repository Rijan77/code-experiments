import 'package:flutter/material.dart';
import 'package:try_project/weather_app/app/data/models/nepali.dart';

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            pickNepaliDateRange(context);
          },
          child: Text("Nepali"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastTry extends StatefulWidget {
  const FlutterToastTry({super.key});

  @override
  State<FlutterToastTry> createState() => _FlutterToastTryState();
}

class _FlutterToastTryState extends State<FlutterToastTry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Fluttertoast.showToast(
              msg: "Hello Rijan, how are you",
              gravity: ToastGravity.TOP,
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          },
          child: Text("Show Toast Notification"),
        ),
      ),
    );
  }
}

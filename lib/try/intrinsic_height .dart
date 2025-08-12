import 'package:flutter/material.dart';

class IntrinsicHeightSt extends StatefulWidget {
  const IntrinsicHeightSt({super.key});

  @override
  State<IntrinsicHeightSt> createState() => _IntrinsicHeightStState();
}

class _IntrinsicHeightStState extends State<IntrinsicHeightSt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(width: 20, color: Colors.red),
                VerticalDivider(thickness: 4, color: Colors.black),
                Container(
                  width: 100,
                  color: Colors.amber,
                  child: CircleAvatar(radius: 50),
                ),
                VerticalDivider(thickness: 4, color: Colors.black),
                Container(width: 100, color: Colors.amber),
                VerticalDivider(thickness: 4, color: Colors.black),
                Container(width: 100, color: Colors.amber),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

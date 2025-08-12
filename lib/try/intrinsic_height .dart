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
              children: [
                Container(height: 30, width: 20, color: Colors.red),
                Divider(thickness: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

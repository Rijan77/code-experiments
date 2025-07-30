import 'package:flutter/material.dart';

class ChangeNotifierExample extends StatefulWidget {
  const ChangeNotifierExample({super.key});

  @override
  State<ChangeNotifierExample> createState() => _ChangeNotifierExample();
}

class _ChangeNotifierExample extends State<ChangeNotifierExample> {
  bool isOpen = false;
  bool isFavorate = false;
  @override
  Widget build(BuildContext context) {
    print("Building_1");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello Notifier",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Center(
              child: Card(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                  },
                  icon: Icon(
                    isOpen ? Icons.toggle_on : Icons.toggle_off,
                    size: 80,
                  ),
                ),
              ),
            ),
          ),

          IconButton(
            onPressed: () {
              setState(() {
                isFavorate = !isFavorate;
              });
            },
            icon: Icon(
              isFavorate ? Icons.favorite_outline : Icons.favorite,
              size: 70,
              color: isFavorate ? Colors.black : Colors.red,
            ),
          ),

          ElevatedButton(onPressed: () {}, child: Text("Next")),
        ],
      ),
    );
  }
}

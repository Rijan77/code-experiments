import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Color> gradientColors = [
    Colors.black,
    Colors.black87,
    Colors.black54,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FaIcon(
                    FontAwesomeIcons.gripVertical,
                    color: Colors.white,
                    size: 20,
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.location_on,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      Text(
                        "Kathmandu",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert, color: Colors.white, size: 30),
                  ),
                ],
              ),
            ),

            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     side: BorderSide(width: 2, color: Colors.white),
            //     backgroundColor: Colors.transparent,
            //     foregroundColor: Colors.white,
            //   ),
            //   onPressed: () {},
            //   child: Text("today"),
            // ),
            Container(
              height: 25,
              width: 80,

              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 2, color: Colors.white),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: FaIcon(
                      FontAwesomeIcons.solidCircle,
                      size: 5,
                      color: Colors.yellow,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "Today",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ClipRRect(
              child: Image.asset(
                'assets/weather.png',
                fit: BoxFit.cover,
                width: 250,
                height: 250,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Image not found',
                    style: TextStyle(color: Colors.red),
                  );
                },
              ),
            ),

            Text(
              "23",
              style: TextStyle(
                fontSize: 90,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Thunderclouds",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Material(
                elevation: 8, // Shadow depth

                borderRadius: BorderRadius.circular(12),
                color:
                    Colors.transparent, // Keep background transparent if needed
                child: Container(
                  height: 200,
                  width: double.infinity,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blueGrey.shade400,
                        Colors.black12,

                        Colors.blueGrey.shade500,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(
                              "July, 21",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(color: Colors.white, thickness: 2),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

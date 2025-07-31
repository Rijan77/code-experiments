import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:try_project/weather_app/app/core/utils/api_status.dart';
import 'package:try_project/weather_app/app/data/repositories/district_service.dart';
import 'package:try_project/weather_app/app/presentation/bloc/cubit/weather_data_cubit.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherDataCubit>().fetchWeatherData();
  }

  int _selectedIndex = 0;

  final List<Color> gradientColors = [
    Colors.black,
    Colors.black87,
    Colors.black54,
  ];

  // final tempe = ["19°C", "15°C", "25°C", "16°C", "15°C", "25°C"];

  final List<Map<String, dynamic>> forecast = [
    {"temp": "19°C", "icon": FontAwesomeIcons.cloudRain, "time": "9.00"},

    {"temp": "21°C", "icon": FontAwesomeIcons.cloud, "time": "12.00"},
    {"temp": "30°C", "icon": FontAwesomeIcons.sun, "time": "16.00"},
    {"temp": "19°C", "icon": FontAwesomeIcons.cloud, "time": "20.00"},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WeatherDataCubit, WeatherDataState>(
        builder: (context, state) {
          if (state.weatherStatus == ApiStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.weatherStatus == ApiStatus.failure) {
            return Center(child: Text(state.error ?? 'Something went wrong'));
          } else if (state.weatherStatus == ApiStatus.success) {
            return Container(
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
                          size: 20.sp,
                        ),

                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 30.sp,
                              ),
                            ),
                            Text(
                              state.weatherApiModel?.locationModel.name ??
                                  "Unknow",

                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 30.sp,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    height: 0.035.sh,
                    width: 0.26.sw,

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
                  SizedBox(height: 30),

                  Image.asset(
                    'assets/icon1.png',
                    fit: BoxFit.cover,
                    width: 0.53.sw,
                    height: 0.22.sh,
                    errorBuilder: (context, error, stackTrace) {
                      return const Text(
                        'Image not found',
                        style: TextStyle(color: Colors.red),
                      );
                    },
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 10),
                    child: Text(
                      "${state.weatherApiModel?.currentWeatherModel.tempC?.toStringAsFixed(1) ?? "--"}°C",
                      style: TextStyle(
                        fontSize: 60.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    state
                            .weatherApiModel
                            ?.currentWeatherModel
                            .condition
                            ?.text ??
                        "--",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 8,

                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                      child: Container(
                        height: 190.sp,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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

                            SizedBox(
                              height: 120.sp,

                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: forecast.length,
                                itemBuilder: (BuildContext context, index) {
                                  final item = forecast[index];
                                  return Card(
                                    color: Color(0xff76b5c5),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),

                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 25,
                                        vertical: 10,
                                      ),
                                      child: SizedBox(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(height: 5),
                                            Text(
                                              item["temp"],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            FaIcon(
                                              item["icon"],
                                              color: Colors.white,
                                              size: 28,
                                            ),
                                            SizedBox(height: 5),
                                            Text(
                                              item["time"],
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 17,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff76b5c5),
        unselectedItemColor: Colors.white,

        selectedIconTheme: IconThemeData(color: Color(0xff76b5c5), size: 32),
        unselectedIconTheme: IconThemeData(color: Colors.white, size: 28),

        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:try_project/weather_app/app/presentation/bloc/cubit/weather_data_cubit.dart';
import 'package:try_project/weather_app/app/presentation/views/button.dart';
import 'package:try_project/weather_app/app/presentation/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,

      child: BlocProvider(
        create: (_) => WeatherDataCubit(),
        child: MaterialApp(debugShowCheckedModeBanner: false, home: Homepage()),
      ),
    );
  }
}

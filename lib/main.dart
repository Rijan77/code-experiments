import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:try_project/weather_app/app/presentation/bloc/cubit/weather_data_cubit.dart';
import 'package:try_project/weather_app/app/presentation/views/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://gzkzusmsgdpilklofxhk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd6a3p1c21zZ2RwaWxrbG9meGhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTM5NTAzODMsImV4cCI6MjA2OTUyNjM4M30.gVHxdtWoV2j_yX68clx3DT2PV-gV0yo-Xr02Plqz70c',
  );

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
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Homepage(),
        ),
      ),
    );
  }
}

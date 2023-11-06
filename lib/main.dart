import 'package:flutter/material.dart';
import 'package:flutter_application_course/app_cubit/app_cubit.dart';
import 'package:flutter_application_course/home_screen.dart';
import 'auth_cubit/auth_cubit.dart';
import 'package:flutter_application_course/dio_hepler.dart';
import 'package:flutter_application_course/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..getHome(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

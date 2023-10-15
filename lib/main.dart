import 'package:flutter/material.dart';
import 'package:flutter_application_course/cubit/app_cubit.dart';
import 'package:flutter_application_course/dio_helper.dart';

import 'package:flutter_application_course/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusinessNews(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()),
    );
  }
}

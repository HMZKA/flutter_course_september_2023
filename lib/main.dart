import 'package:flutter/material.dart';
import 'package:flutter_application_course/cubit/auth_cubit.dart';
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
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}

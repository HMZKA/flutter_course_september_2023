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
      create: (context) => AppCubit()
        ..getBusinessNews()
        ..getSportNews(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit().get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.blueGrey),
                scaffoldBackgroundColor: Colors.blueGrey,
                primarySwatch: Colors.green,
                cardColor: Colors.green,
                textTheme: const TextTheme(
                    bodyMedium: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white))),
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.green,
                cardColor: Colors.white,
                textTheme: const TextTheme(
                    bodyMedium:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700))),
          );
        },
      ),
    );
  }
}

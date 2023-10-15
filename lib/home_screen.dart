import 'package:flutter/material.dart';
import 'package:flutter_application_course/business_screen.dart';
import 'package:flutter_application_course/cubit/app_cubit.dart';
import 'package:flutter_application_course/sport_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List screens = [BusinessScreen(), SportScreen()];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
          appBar: AppBar(title: Text("NewsApp")),
          bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                cubit.currentIndex(value);
              },
              currentIndex: cubit.index,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), label: "Business"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: "Sports"),
              ]),
          body: screens[cubit.index],
        );
      },
    );
  }
}

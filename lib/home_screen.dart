import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_course/business_screen.dart';
import 'package:flutter_application_course/cubit/app_cubit.dart';
import 'package:flutter_application_course/search_screen.dart';
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
          appBar: AppBar(
            title: Text("NewsApp"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ));
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    cubit.changeTheme();
                  },
                  icon: Icon(CupertinoIcons.moon))
            ],
          ),
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

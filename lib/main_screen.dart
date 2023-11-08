import 'package:flutter/material.dart';
import 'package:flutter_application_course/app_cubit/app_cubit.dart';
import 'package:flutter_application_course/categories_screen.dart';
import 'package:flutter_application_course/favorite_screen.dart';
import 'package:flutter_application_course/home_screen.dart';
import 'package:flutter_application_course/profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List screen = const [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: Text("ShopMall"),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.index,
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                cubit.changeIndex(value);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_rounded), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
              ],
            ),
            body: screen[cubit.index]);
      },
    );
  }
}

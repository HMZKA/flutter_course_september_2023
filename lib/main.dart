import 'package:flutter/material.dart';

import 'package:flutter_application_course/controllers/app_cubit/app_cubit.dart';
import 'package:flutter_application_course/controllers/auth_cubit/auth_cubit.dart';
import 'package:flutter_application_course/screens/on_boarding_screen.dart';
import 'package:flutter_application_course/utils/cache.dart';
import 'package:flutter_application_course/screens/home_screen.dart';
import 'package:flutter_application_course/screens/main_screen.dart';

import 'package:flutter_application_course/utils/dio_hepler.dart';
import 'package:flutter_application_course/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  Widget screen = OnBoardingScreen();
  if (CacheHelper.get(key: "onBoard") ?? false) {
    screen = LoginScreen();
  }
  runApp(MyApp(
    screen: screen,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.screen});
  Widget screen;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit()
            ..getHome()
            ..getCategories()
            ..getProfile(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: screen,
      ),
    );
  }
}

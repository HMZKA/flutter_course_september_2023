import 'package:flutter/material.dart';
import 'package:flutter_application_course/controllers/app_cubit/app_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container();
      },
    );
  }
}

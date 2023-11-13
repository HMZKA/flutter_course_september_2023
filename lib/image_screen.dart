import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_course/cubit/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Image Picker"),
          ),
          body: Column(children: [
            SizedBox(
              child: cubit.file != null
                  ? Image.file(File("${cubit.file?.path}"))
                  : Image.asset("images/10.jpg"),
            ),
            ElevatedButton(
                onPressed: () {
                  cubit.pickImage();
                },
                child: Text("Pick Image"))
          ]),
        );
      },
    );
  }
}

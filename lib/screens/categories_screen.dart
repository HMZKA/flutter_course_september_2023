import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_course/controllers/app_cubit/app_cubit.dart';
import 'package:flutter_application_course/models/categories_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        var categoryModel = AppCubit().get(context).categoryModel;
        return BuildCondition(
          condition: categoryModel != null,
          builder: (context) => ListView.builder(
            itemCount: categoryModel!.data.length,
            itemBuilder: (BuildContext context, int index) {
              return buildCategory(context, categoryModel.data[index]);
            },
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Padding buildCategory(BuildContext context, categoryModel) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {
          AppCubit().get(context).getCategoryDetails(categoryModel.id);
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.network(
                "${categoryModel?.image}",
                height: MediaQuery.of(context).size.height / 7,
              ),
              Text(
                "${categoryModel?.name}",
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
    );
  }
}

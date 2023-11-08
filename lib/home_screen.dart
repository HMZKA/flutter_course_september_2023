import 'package:buildcondition/buildcondition.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_course/app_cubit/app_cubit.dart';
import 'package:flutter_application_course/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        var homeModel = AppCubit().get(context).homeModel;
        return BuildCondition(
          condition: homeModel != null,
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  CarouselSlider(
                    items: homeModel?.data?.banners
                        .map((e) => Image.network(e.image!))
                        .toList(),
                    options:
                        CarouselOptions(autoPlay: true, viewportFraction: 1),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "New Products",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                  ),
                  GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      childAspectRatio: 0.70,
                      shrinkWrap: true,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 5.0,
                      crossAxisCount: 2,
                      children: [
                        for (int i = 0;
                            i < homeModel!.data!.products.length;
                            i++)
                          buildProduct(context, homeModel, i)
                      ])
                ],
              ),
            );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Container buildProduct(BuildContext context, HomeModel? homeModel, int i) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        children: [
          Image.network(
            "${homeModel?.data?.products[i].image}",
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 5,
          ),
          Text("${homeModel?.data?.products[i].name}"),
        ],
      ),
    );
  }
}

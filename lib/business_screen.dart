import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_course/cubit/app_cubit.dart';
import 'package:flutter_application_course/news_model.dart';
import 'package:flutter_application_course/web_view_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return BuildCondition(
          condition: AppCubit().get(context).newsModel != null,
          builder: (context) => ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: AppCubit().get(context).newsModel!.articles.length,
            itemBuilder: (BuildContext context, int index) {
              return buildItem(
                  newsModel: AppCubit().get(context).newsModel!,
                  index: index,
                  context: context);
            },
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildItem(
      {required NewsModel newsModel,
      required int index,
      required BuildContext context}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              WebViewScreen(url: newsModel.articles[index].url!),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: Column(
            children: [
              Image.network(
                "${newsModel.articles[index].urlToImage}",
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset("images/10.jpg"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${newsModel.articles[index].title}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

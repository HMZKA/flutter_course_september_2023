import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_course/cubit/app_cubit.dart';
import 'package:flutter_application_course/news_model.dart';
import 'package:flutter_application_course/web_view_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit().get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    AppCubit().get(context).search(search: value);
                  },
                  decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                BuildCondition(
                  condition: cubit.searchModel != null,
                  builder: (context) {
                    return Expanded(
                      child: ListView.separated(
                        itemCount: cubit.searchModel!.articles.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 7,
                          );
                        },
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return buildSearchItem(
                              searchModel: cubit.searchModel!,
                              index: index,
                              context: context);
                        },
                      ),
                    );
                  },
                  fallback: (context) => Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: state is SearchLoadingState
                        ? const LinearProgressIndicator()
                        : const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ListTile buildSearchItem(
          {required NewsModel searchModel,
          required int index,
          required BuildContext context}) =>
      ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                WebViewScreen(url: searchModel.articles[index].url!),
          ));
        },
        contentPadding: EdgeInsets.zero,
        leading: SizedBox(
            child: Image.network(
          "${searchModel.articles[index].urlToImage}",
          errorBuilder: (context, error, stackTrace) =>
              Image.asset("images/10.jpg"),
        )),
        title: Text("${searchModel.articles[index].title}"),
      );
}

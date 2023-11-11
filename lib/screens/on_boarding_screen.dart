import 'package:flutter/material.dart';
import 'package:flutter_application_course/screens/login_screen.dart';
import 'package:flutter_application_course/utils/cache.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  var pageController = PageController();
  List titles = [
    "Welcome to our Mall",
    "Enjoy your journey in the Mall",
    "Want to enjoy your journey in Mall"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
            child: Text("Skip"),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                  (route) => false);
              CacheHelper.setBool(key: "onBoard", value: true);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageController.page == 2.0
              ? {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false),
                  CacheHelper.setBool(key: "onBoard", value: true)
                }
              : pageController.nextPage(
                  duration: Duration(milliseconds: 750), curve: Curves.linear);
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
      body: PageView.builder(
        controller: pageController,
        itemCount: titles.length,
        itemBuilder: (context, index) => Center(
            child: Text(
          titles[index],
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        )),
      ),
    );
  }
}

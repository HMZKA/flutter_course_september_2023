import 'package:flutter/material.dart';
import 'package:animated_rating_stars/animated_rating_stars.dart';

class StreetsScreen extends StatelessWidget {
  const StreetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("Find Places"),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 30,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return itemBuilder();
        },
      ),
    );
  }

  Card itemBuilder() {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 6.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.asset("images/10.jpg"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Orange Juice",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              AnimatedRatingStars(
                  //   readOnly: true,
                  animationDuration: const Duration(milliseconds: 700),
                  animationCurve: Curves.ease,
                  starSize: 20,
                  onChanged: (p0) {},
                  customFilledIcon: Icons.star_outlined,
                  customHalfFilledIcon: Icons.star_half,
                  customEmptyIcon: Icons.star_outline)
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Restaurant",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "7.6mi",
                style: TextStyle(fontSize: 16),
              )
            ],
          )
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              print("Clicked!!!");
            },
            icon: const Icon(Icons.menu)),
        title: const Text("Chats"),
        actions: [
          IconButton(
              onPressed: () {
                print("Edit");
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                print("camera");
              },
              icon: const Icon(Icons.camera)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.all(12.0),
                padding: const EdgeInsets.all(12.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(25)),
                child: const Row(children: [
                  Icon(Icons.search),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(fontSize: 20),
                  )
                ]),
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 7,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return buildStory();
                  },
                ),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 20,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 7,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return buildChat();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChat() {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      leading: const Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                "https://th.bing.com/th/id/R.bb42df226d4d6f991398c239937edfb6?rik=L4%2fosSZE66aEVw&riu=http%3a%2f%2fupload.wikimedia.org%2fwikipedia%2fcommons%2f1%2f15%2fFlower-IMG_0314.JPG&ehk=ZTUIYbxCfLePdqTNWgKS66R6NuAmJzUH9JSnY15yKqc%3d&risl=&pid=ImgRaw&r=0"),
          ),
          CircleAvatar(
            radius: 9,
            backgroundColor: Colors.white,
          ),
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 8,
          )
        ],
      ),
      title: const Text("Ahmad Ahmad"),
      subtitle: const Text("Hello My name is Ahmad"),
      trailing: const Text("14:00"),
    );
  }

  Widget buildStory() {
    return const SizedBox(
      width: 100,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 37,
                backgroundImage: NetworkImage(
                    "https://th.bing.com/th/id/R.bb42df226d4d6f991398c239937edfb6?rik=L4%2fosSZE66aEVw&riu=http%3a%2f%2fupload.wikimedia.org%2fwikipedia%2fcommons%2f1%2f15%2fFlower-IMG_0314.JPG&ehk=ZTUIYbxCfLePdqTNWgKS66R6NuAmJzUH9JSnY15yKqc%3d&risl=&pid=ImgRaw&r=0"),
              ),
              CircleAvatar(
                radius: 11,
                backgroundColor: Colors.white,
              ),
              CircleAvatar(
                backgroundColor: Colors.green,
                radius: 10,
              )
            ],
          ),
          Text(
            "Ahmad Ahmad Ahmad AhmadAhmad AhmadAhmad AhmadAhmad AhmadAhmad AhmadAhmad AhmadAhmad AhmadAhmad AhmadAhmad Ahmad",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

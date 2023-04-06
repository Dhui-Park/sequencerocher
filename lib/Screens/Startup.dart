import 'package:flutter/material.dart';
import 'package:sequencerocher/Screens/Ready.dart';

class Startup extends StatefulWidget {
  const Startup({super.key});

  @override
  State<Startup> createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AskReady(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: const Text(
            "Start",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              title: const Text(
                "Yoga",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              background: Image.network(
                "https://static.vecteezy.com/system/resources/thumbnails/004/338/659/small_2x/woman-yoga-for-new-year-resolution-free-vector.jpg",
                fit: BoxFit.cover,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.thumb_up_alt_outlined,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "16 Mins || 26 Workouts",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(
                      thickness: 2,
                    ),
                    itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: ListTile(
                        leading: Image.network(
                          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/59b7c198206659.5ed6f840b25bd.gif",
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          "Yoga $index",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          (index % 2 == 0) ? "00:20" : "00.30",
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

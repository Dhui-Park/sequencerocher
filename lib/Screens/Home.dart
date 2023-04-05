import 'package:flutter/material.dart';
import 'package:sequencerocher/Screens/Startup.dart';
import 'package:sequencerocher/Widget/CustomAppBar.dart';
import 'package:sequencerocher/Widget/CustomDrawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorsTween, _homeTween, _yogaTween, _iconTween, _drawerTween;
  late AnimationController _textAnimationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0),
    );
    _colorsTween = ColorTween(
      begin: Colors.transparent,
      end: Colors.white,
    ).animate(_animationController);
    _iconTween = ColorTween(
      begin: Colors.white,
      end: const Color(0xFFE6D2B5),
    ).animate(_animationController);
    _drawerTween = ColorTween(
      begin: Colors.white,
      end: Colors.black,
    ).animate(_animationController);
    _homeTween = ColorTween(
      begin: Colors.white,
      end: const Color(0xFFE6D2B5),
    ).animate(_animationController);
    _yogaTween = ColorTween(
      begin: Colors.white,
      end: Colors.black,
    ).animate(_animationController);
    _textAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0),
    );
    super.initState();
  }

  bool scrollListener(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: scrollListener,
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(50, 150, 50, 40),
                              decoration: const BoxDecoration(
                                color: Color(0xFFE6D2B5),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(13),
                                  bottomLeft: Radius.circular(13),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: const [
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                        ),
                                      ),
                                      Text(
                                        "Streak",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "120",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                        ),
                                      ),
                                      Text(
                                        "kcal",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "26",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                        ),
                                      ),
                                      Text(
                                        "Minutes",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text(
                                      "Yoga For All",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Startup(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 150,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    "https://static.vecteezy.com/system/resources/thumbnails/004/338/659/small_2x/woman-yoga-for-new-year-resolution-free-vector.jpg"),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 150,
                                            color: Colors.black26,
                                          ),
                                          const Positioned(
                                            right: 20,
                                            left: 10,
                                            top: 10,
                                            child: Text(
                                              "Yoga For Begineers",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          const Positioned(
                                            right: 30,
                                            left: 12,
                                            top: 38,
                                            child: Text(
                                              "Last Time : 2 Feb",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQVIuZQkBcuyXYWogJiGD-NJqrQN7dJTtRprFYKV-PqdSHxbC7Q1fxMM-qKFOg1IeeZNE&usqp=CAU"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        const Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Weight Loss Yoga",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          right: 30,
                                          left: 12,
                                          top: 38,
                                          child: Text(
                                            "Last Time : 22 Jan",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://static.vecteezy.com/system/resources/thumbnails/000/266/144/small_2x/Yoga_Class_Illustration.jpg"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        const Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Suryanamaskar",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          right: 30,
                                          left: 12,
                                          top: 38,
                                          child: Text(
                                            "Last Time : Yesterday",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    width: MediaQuery.of(context).size.width,
                                    child: const Text(
                                      "Choose Your Type",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://static.vecteezy.com/system/resources/thumbnails/000/266/139/small/Yoga_Class_Illustration.jpg"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        const Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Power Yoga",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          right: 30,
                                          left: 12,
                                          top: 38,
                                          child: Text(
                                            "Last Time : Yesterday",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://static.vecteezy.com/system/resources/previews/000/266/150/non_2x/vector-yoga-class-illustration.jpg"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        const Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Breathing Yoga",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          right: 30,
                                          left: 12,
                                          top: 38,
                                          child: Text(
                                            "Last Time : 29 Jan",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://i.pinimg.com/originals/67/77/00/677700688eee6263f5ace1354d1471c2.png"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 150,
                                          color: Colors.black26,
                                        ),
                                        const Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 10,
                                          child: Text(
                                            "Increase Flexibility",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          right: 30,
                                          left: 12,
                                          top: 38,
                                          child: Text(
                                            "Last Time : 29 Jan",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  CustomAppBar(
                      animationController: _animationController,
                      colorsTween: _colorsTween,
                      drawerTween: _drawerTween,
                      homeTween: _homeTween,
                      iconTween: _iconTween,
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      yogaTween: _yogaTween)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

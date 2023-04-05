import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  AnimationController animationController;
  Animation colorsTween, homeTween, yogaTween, iconTween, drawerTween;
  Function()? onPressed;

  CustomAppBar({
    super.key,
    required this.animationController,
    required this.colorsTween,
    required this.drawerTween,
    required this.homeTween,
    required this.yogaTween,
    required this.iconTween,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.dehaze,
              color: drawerTween.value,
            ),
            onPressed: onPressed,
          ),
          backgroundColor: colorsTween.value,
          elevation: 0,
          title: Row(
            children: [
              Text(
                "Home ",
                style: TextStyle(
                  color: homeTween.value,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "Yoga",
                style: TextStyle(
                  color: yogaTween.value,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          actions: [
            Icon(
              Icons.notifications,
              color: iconTween.value,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

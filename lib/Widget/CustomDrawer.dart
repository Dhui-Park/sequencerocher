import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.template.net/83183/free-woman-doing-yoga-illustration-taum8.jpg"),
              ),
            ),
          ),
          const ListTile(
            title: Text(
              "Reset Progress",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: Icon(
              Icons.restart_alt_sharp,
              size: 25,
            ),
          ),
          const ListTile(
            title: Text(
              "Share with Friends",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: Icon(
              Icons.share,
              size: 25,
            ),
          ),
          const ListTile(
            title: Text(
              "Rate us",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: Icon(
              Icons.star_border,
              size: 25,
            ),
          ),
          const ListTile(
            title: Text(
              "Feedback",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: Icon(
              Icons.comment_outlined,
              size: 25,
            ),
          ),
          const ListTile(
            title: Text(
              "Privacy Policy",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: Icon(
              Icons.security_outlined,
              size: 25,
            ),
          ),
          const Divider(
            thickness: 2,
            endIndent: 30,
            indent: 30,
          ),
          const Text(
            "Version 1.0.0",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

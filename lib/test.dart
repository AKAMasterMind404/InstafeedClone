import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNavbar extends StatefulWidget {
  @override
  _MyBottomNavbarState createState() => _MyBottomNavbarState();
}

class _MyBottomNavbarState extends State<MyBottomNavbar> {
  int _index = 0;
  String action = "Home";
  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      onTap: (int val) {
        switch (val) {
          case 0:
            {
              action = "Home";
            }
            break;

          case 1:
            {
              action = "Explore"; //statements;
            }
            break;
          case 2:
            {
              action = "Chats"; //statements;
            }
            break;
          case 3:
            {
              action = "Settings"; //statements;
            }
            break;
          default:
            {
              //statements;
            }
            break;
        }

        setState(() => _index = val);
      },
      currentIndex: _index,
      items: [
        FloatingNavbarItem(icon: Icons.home, title: 'Home'),
        FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
        FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
        FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
      ],
    );
  }
}

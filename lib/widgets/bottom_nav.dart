import 'package:flutter/material.dart';
import 'package:insta_clone/screens/home_page.dart';
import 'package:insta_clone/widgets/profile_img.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      iconSize: 27.0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
          activeIcon: Icon(
            Icons.search_rounded,
            color: Colors.white,
            size: 29,
          ),
          label: 'search',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.add_box,
              color: Colors.white,
            ),
            label: 'Add photo'),
        BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.shoppingOutline,
              color: Colors.white,
            ),
            activeIcon: Icon(
              MdiIcons.shopping,
              color: Colors.white,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/img1.jpg'),
              radius: 16,
            ),
            label: 'Profile'),
      ],
    );
  }
}

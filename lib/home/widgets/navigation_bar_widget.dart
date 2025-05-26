import 'package:flutter/material.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF0F0F0F),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (value) {
        
      },
      items: [
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/home2.png", width: 36, height: 36),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/news2.png", width: 36, height: 36),
          label: "News",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            //
            "assets/images/trackbox2.png",
            width: 36,
            height: 36,
          ),
          label: "TrackBox",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/projects2.png",
            width: 36,
            height: 36,
          ),
          label: "Projects",
        ),
      ],
    );
  }
}
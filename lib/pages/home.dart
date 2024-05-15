import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/tabs/home_screen.dart';
import 'package:instagram_clone/pages/tabs/profile_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List selectedPage = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: selectedPage[currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(splashFactory: NoSplash.splashFactory),
        child: NavigationBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          selectedIndex: currentIndex,
          indicatorColor: Colors.transparent,
          height: 70,
          onDestinationSelected: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          destinations: [
            NavigationDestination(
                selectedIcon: Image.asset(
                  "assets/icons/ic_home_filled.png",
                  height: 25,
                ),
                icon: Image.asset(
                  "assets/icons/ic_home.png",
                  height: 25,
                ),
                label: ""),
            NavigationDestination(
                icon: Image.asset(
                  "assets/icons/ic_search.png",
                  height: 25,
                ),
                label: ""),
            NavigationDestination(
                icon: Image.asset(
                  "assets/icons/ic_square-plus.png",
                  height: 25,
                ),
                label: ""),
            NavigationDestination(
                icon: Image.asset(
                  "assets/icons/ic_reels.png",
                  height: 25,
                ),
                selectedIcon: Image.asset(
                  "assets/icons/ic_reels_filled.png",
                  height: 25,
                ),
                label: ""),
            const NavigationDestination(
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://cdn-icons-png.flaticon.com/512/1253/1253756.png",
                  ),
                  backgroundColor: Colors.black,
                ),
                label: "")
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/tabs/home_screen.dart';
import 'package:instagram_clone/pages/tabs/search_screen.dart';
import 'package:instagram_clone/pages/tabs/user_profile_screen.dart';
import 'package:instagram_clone/services/functions/databaseFunctions.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    findUsername();
  }

  findUsername() async {
    final username = await getUserName();
    setState(() {
      userName = username;
    });
  }

  late String userName;
  int currentIndex = 0;
  selectedpage(index) {
    switch (index) {
      case 0:
        return const HomeScreen();

      case 1:
        return const SearchScreen();

      case 2:
        return const HomeScreen();

      case 3:
        return const HomeScreen();

      case 4:
        return UserProfileScreen(
          username: userName,
        );
      default:
        return const HomeScreen();
    }
  }

  // List selectedPage = [
  //   const HomeScreen(),
  //   const HomeScreen(),
  //   const HomeScreen(),
  //   const HomeScreen(),
  //   ProfileScreen(
  //     username: widget.userName,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: selectedpage(currentIndex),
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

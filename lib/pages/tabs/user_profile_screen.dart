import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/auth/login_screen.dart';
import 'package:instagram_clone/utils/customfontstyle.dart';
import 'package:instagram_clone/widgets/features/post_tabbar_view.dart';
import 'package:instagram_clone/widgets/features/reels_tabbar_view.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({
    super.key,
    required this.username,
  });
  final String username;

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          title: Text(
            widget.username,
            style: CustomFontStyle.boldText.copyWith(),
          ),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                    (route) => false);
              },
              icon: const Icon(Icons.logout),
            ),
            const SizedBox(width: 10),
            Image.asset(
              "assets/icons/ic_more_burger.png",
              height: 25,
            ),
            const SizedBox(width: 20),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/1253/1253756.png",
                    ),
                    backgroundColor: Colors.black,
                  ),
                  Text(
                    "12\nposts",
                    textAlign: TextAlign.center,
                    style: CustomFontStyle.mediumText.copyWith(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "273\nfollowers",
                    textAlign: TextAlign.center,
                    style: CustomFontStyle.mediumText.copyWith(
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "100\nfollowing",
                    textAlign: TextAlign.center,
                    style: CustomFontStyle.mediumText.copyWith(
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Bhupender Singh",
                  style: CustomFontStyle.mediumText.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Your opinion is not my reality",
                  style: CustomFontStyle.regularText.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Edit profile",
                        style: CustomFontStyle.mediumText,
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Share profile",
                        style: CustomFontStyle.mediumText,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                splashFactory: NoSplash.splashFactory,
                tabs: [
                  Tab(
                    text: "Posts",
                  ),
                  Tab(
                    text: "Reels",
                  ),
                  Tab(
                    text: "Tagged",
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: const TabBarView(children: [
                  PostTabBarView(),
                  ReelsTabBarView(),
                  PostTabBarView(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

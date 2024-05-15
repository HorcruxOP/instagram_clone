import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/customfontstyle.dart';
import 'package:instagram_clone/widgets/features/home_screen_post.dart';
import 'package:instagram_clone/widgets/features/stories_listbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "Instagram",
          style: CustomFontStyle.condensedBoldText.copyWith(
            fontSize: 35,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/ic_heart.png",
              height: 25,
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/icons/ic_chat.png",
              height: 25,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StoriesListBar(),
            SizedBox(height: 10),
            HomeScreenPost(),
          ],
        ),
      ),
    );
  }
}

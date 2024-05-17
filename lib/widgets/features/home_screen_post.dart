import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/others/profile_screen.dart';
import 'package:instagram_clone/utils/customfontstyle.dart';

class HomeScreenPost extends StatefulWidget {
  const HomeScreenPost({super.key});

  @override
  State<HomeScreenPost> createState() => _HomeScreenPostState();
}

class _HomeScreenPostState extends State<HomeScreenPost> {
  bool selectedLikeValue = false;
  bool selectedSaveValue = false;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          height: 400,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/1253/1253756.png",
                        ),
                        backgroundColor: Colors.black,
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(
                                  name: "name",
                                  userName: "name",
                                  imageUrl: "name",
                                ),
                              ));
                        },
                        child: Text(
                          "name",
                          style: CustomFontStyle.mediumText.copyWith(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/icons/ic_more.png",
                      height: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/1253/1253756.png",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () {
                          setState(() {
                            selectedLikeValue = !selectedLikeValue;
                          });
                        },
                        isSelected: selectedLikeValue,
                        selectedIcon: Image.asset(
                          "assets/icons/ic_like_filled.png",
                          color: Colors.red,
                          height: 25,
                        ),
                        icon: Image.asset(
                          "assets/icons/ic_like.png",
                          height: 25,
                        ),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/ic_comment.png",
                          height: 25,
                        ),
                      ),
                      IconButton(
                        style: IconButton.styleFrom(
                          splashFactory: NoSplash.splashFactory,
                        ),
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/icons/ic_send.png",
                          height: 25,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      splashFactory: NoSplash.splashFactory,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedSaveValue = !selectedSaveValue;
                      });
                    },
                    isSelected: selectedSaveValue,
                    selectedIcon: Image.asset(
                      "assets/icons/ic_save_filled.png",
                      height: 25,
                    ),
                    icon: Image.asset(
                      "assets/icons/ic_save.png",
                      height: 25,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/customfontstyle.dart';
import 'package:instagram_clone/widgets/features/post_tabbar_view.dart';
import 'package:instagram_clone/widgets/features/reels_tabbar_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {super.key,
      required this.name,
      required this.userName,
      required this.imageUrl});
  final String name, userName, imageUrl;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isFollow = false;
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
            widget.userName,
            style: CustomFontStyle.boldText.copyWith(),
          ),
          actions: [
            Image.asset(
              "assets/icons/ic_more.png",
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
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      widget.imageUrl,
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
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  widget.name,
                  style: CustomFontStyle.mediumText.copyWith(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Your opinion is not my reality",
                  style: CustomFontStyle.regularText.copyWith(
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              isFollow
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isFollow = !isFollow;
                            });
                          },
                          child: Container(
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
                                "Unfollow",
                                style: CustomFontStyle.mediumText,
                              ),
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
                              "Message",
                              style: CustomFontStyle.mediumText,
                            ),
                          ),
                        )
                      ],
                    )
                  : Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isFollow = !isFollow;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              "Follow",
                              style: CustomFontStyle.mediumText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              isFollow
                  ? const TabBar(
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
                    )
                  : Container(),
              isFollow
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: const TabBarView(children: [
                        PostTabBarView(),
                        ReelsTabBarView(),
                        PostTabBarView(),
                      ]),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

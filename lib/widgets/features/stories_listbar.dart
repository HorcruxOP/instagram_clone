import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/customfontstyle.dart';

class StoriesListBar extends StatelessWidget {
  const StoriesListBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/1253/1253756.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 10,
                ),
                child: Text(
                  "Your Story",
                  style: CustomFontStyle.regularText,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/512/1253/1253756.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        top: 10,
                      ),
                      child: Text(
                        "data",
                        style: CustomFontStyle.regularText,
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

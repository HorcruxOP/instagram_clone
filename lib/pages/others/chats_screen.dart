import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/customfontstyle.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "bhupender.5911",
          style: CustomFontStyle.boldText.copyWith(
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Messages",
              style: CustomFontStyle.mediumText.copyWith(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/1253/1253756.png",
                    ),
                    backgroundColor: Colors.black,
                  ),
                  title: Text(
                    "data",
                    style: CustomFontStyle.mediumText.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    "data",
                    style: CustomFontStyle.regularText.copyWith(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: const Icon(Icons.camera_alt_outlined),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

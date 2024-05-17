import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/others/profile_screen.dart';
import 'package:instagram_clone/utils/customfontstyle.dart';

Future<Widget> finduser(String searchQuery) async {
  if (searchQuery.isEmpty) {
    return Center(
        child: Text(
      "Type to search",
      style: CustomFontStyle.mediumText.copyWith(
        fontSize: 18,
        color: Colors.grey,
      ),
    ));
  }
  var docsName = await FirebaseFirestore.instance.collection("Users").get();
  List matchingId = [];
  List name = [];
  List profileImage = [];
  for (var doc in docsName.docs) {
    if (doc.id.contains(searchQuery)) {
      matchingId.add(doc.id);
      var fieldUrl = await FirebaseFirestore.instance
          .collection("Users")
          .doc(doc.id)
          .get();
      profileImage.add(fieldUrl["userData"]["profileImage"]);
      name.add(fieldUrl["userData"]["name"]);
    }
  }
  if (matchingId.isEmpty) {
    return Center(
        child: Text(
      "No user found",
      style: CustomFontStyle.mediumText.copyWith(
        fontSize: 18,
        color: Colors.grey,
      ),
    ));
  }
  return ListView.builder(
      itemCount: matchingId.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(name: name[index],userName: matchingId[index],imageUrl: profileImage[index],),
                  ));
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    profileImage[index],
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      matchingId[index],
                      style: CustomFontStyle.mediumText.copyWith(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      name[index],
                      style: CustomFontStyle.mediumText.copyWith(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

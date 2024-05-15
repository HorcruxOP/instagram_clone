import 'package:flutter/material.dart';

class ReelsTabBarView extends StatelessWidget {
  const ReelsTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) {
        return Container(
          width: 90,
          height: 90,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/1253/1253756.png",
              ),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/widgets/widget.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: stories.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Column(
                
                children: const [
                  
                  UserProfile(),
                  Text(
                    'Add story',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  )
                ],
              );
            }
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  height: 67,
                  width: 67,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFF9B2282), Color(0xFFEEA863)])),
                  child: Container(
                    width: 65,
                    height: 65,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                    stories[index - 1].imageUrl.toString()),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  stories[index - 1].userName.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                )
              ],
            );
          }),
    );
  }
}

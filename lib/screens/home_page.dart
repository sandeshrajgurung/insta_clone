// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:insta_clone/models/post_model.dart';
import 'package:insta_clone/widgets/widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        shape: Border(
            bottom: BorderSide(
          color: Colors.grey,
          width: 0.2,
        )),
        elevation: 0,
        backgroundColor: Colors.black12,
        title: const Text(
          'Instagram',
          style: TextStyle(fontFamily: 'Billabong', fontSize: 32.0),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            iconSize: 27,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              MdiIcons.facebookMessenger,
            ),
            iconSize: 27,
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          Stories(),
          Divider(
            height: 5.0,
            thickness: 0.2,
            color: Colors.white,
          ),
          //list view for post feed
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

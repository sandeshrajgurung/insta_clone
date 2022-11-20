import 'package:flutter/material.dart';

class ProfileImg extends StatelessWidget {
  final String imageUrl;

  const ProfileImg({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 18.0,
      backgroundImage: AssetImage(imageUrl),
    );
  }
}

import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.all(5.0),
          height: 60.0,
          width: 60.0,
          child: const CircleAvatar(
            child: ClipOval(
              child: Image(
                height: 60,
                width: 60,
                image: AssetImage('assets/images/img1.jpg'),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 8.0,
          right: 10.0,
          child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent,
                border: Border.all(width: 1.5, color: Colors.black)),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 17,
            ),
          ),
        )
      ],
    );
  }
}

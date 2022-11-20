import 'package:flutter/material.dart';

class Post {
  String authorName;
  String address;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;
  int like;
  int comments;
  String captions;

  Post(
      {required this.address,
      required this.authorName,
      required this.authorImageUrl,
      required this.timeAgo,
      required this.imageUrl,
      required this.like,
      required this.comments,
      required this.captions});
}

final List<Post> posts = [
  Post(
    like: 600,
    comments: 120,
    captions: 'I created this app and added my own photo, cuz why not? ',
    address: 'Kathmandu, Nepal',
    authorName: 'Sandesh Raj',
    authorImageUrl: 'assets/images/img1.jpg',
    timeAgo: '10 min',
    imageUrl: 'assets/images/img2.jpg',
  ),
  Post(
    like: 500,
    comments: 126,
    captions: 'Tired of witing static Caption',
    address: 'Texas, USA',
    authorName: 'Angelina Jolie',
    authorImageUrl: 'assets/images/user3.png',
    timeAgo: '5 min',
    imageUrl: 'assets/images/user0.png',
  ),
  Post(
    like: 350,
    comments: 65,
    captions: 'K ma hancy haina raa.',
    address: 'Florida, USA',
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/img3.jpg',
    timeAgo: '10 min',
    imageUrl: 'assets/images/img3.jpg',
  ),
  Post(
    like: 300,
    comments: 12,
    captions: 'Some days you make the coffee, other days the coffee makes you.',
    authorName: 'Jennie',
    address: 'Toronto, Canada',
    authorImageUrl: 'assets/images/user0.png',
    timeAgo: '5 min',
    imageUrl: 'assets/images/post0.jpg',
  ),
  Post(
    like: 400,
    comments: 120,
    captions: 'Coffee all day.',
    address: 'Kathmandu, Nepal',
    authorName: 'Alina Smith',
    authorImageUrl: 'assets/images/user4.png',
    timeAgo: '5 min',
    imageUrl: 'assets/images/post1.jpg',
  ),
];

class Story {
  String userName;
  String imageUrl;
  bool isViewed;

  Story({required this.imageUrl, this.isViewed = false, required this.userName});
}

final List<Story> stories = [

  Story(
    imageUrl: 'assets/images/img3.jpg', 
    userName: 'Sam Martin',
    ),
  Story(
    imageUrl: 'assets/images/post1.jpg', 
    userName: 'Emilia',
    ),
  Story(imageUrl: 'assets/images/user4.png', userName: 'Alina Smith'),
  Story(imageUrl: 'assets/images/user0.png', userName: 'Jennie'),
  Story(imageUrl: 'assets/images/post0.jpg', userName: 'Erica'),
  Story(imageUrl: 'assets/images/user2.png', userName: 'Sam martin')
  
  // 'assets/images/img3.jpg',
  // 'assets/images/post1.jpg',
  // 'assets/images/user4.png',
  // 'assets/images/user0.png',
  // 'assets/images/post0.jpg',
  // 'assets/images/user2.png',
];

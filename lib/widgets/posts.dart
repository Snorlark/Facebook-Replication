import 'package:flutter/material.dart';
import 'package:myapp/widgets/newsfeed.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
               NewsFeed(
          profileImageURL: 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg',
          userName: 'Lark',
          datePosted: 'January 16',
          postText: 'Hello, world!',
          postImageURL: 'https://th.bing.com/th/id/OIP.z_8PLWaL0kt_aa0R6OrF2gHaEK?rs=1&pid=ImgDetMain',
          likesCount: 10,
        ),
        NewsFeed(
          userName: 'Lark',
          datePosted: 'January 16',
          postText: 'Text only',
          likesCount: 10,
        ),
        NewsFeed(
          profileImageURL: 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg',
          userName: 'Lark',
          datePosted: 'January 16',
          postText: 'Hello, world!',
          postImageURL: 'https://billboardphilippines.com/wp-content/uploads/2024/07/DIONELA-JAY-R-FTR-IMG-1-1600x838.jpg',
          likesCount: 50,
        ),
      ],
    );
  }
}
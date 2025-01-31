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
          postImageURL: 'https://media.tenor.com/SbfbnhIoLU8AAAAM/scrunched-face.gif',
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
          postImageURL: 'https://media.tenor.com/SbfbnhIoLU8AAAAM/scrunched-face.gif',
          likesCount: 50,
        ),
      ],
    );
  }
}
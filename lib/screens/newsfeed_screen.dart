import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/newsfeed.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(ScreenUtil().setSp(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              CircleAvatar(
                radius: ScreenUtil().setSp(20),
                backgroundImage: const NetworkImage('https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg')
              ),
              SizedBox(
                width: ScreenUtil().setWidth(250),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(ScreenUtil().setSp(20))
                    ),
                    hintText: 'What\'s on your mind?',
                  )
                ),
              ),
              const Icon(Icons.image, color: Colors.blue,)
            ]
          ),
        ),
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
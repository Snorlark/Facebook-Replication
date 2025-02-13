import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/widgets/customfont.dart';
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
        
        SizedBox(height: 20.h,),
        columnCarousel(),

        NewsFeed(
          profileImageURL: 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg',
          userName: 'Lark',
          datePosted: 'January 16',
          postText: 'Hello, world!',
          postImageURL: 'https://media.tenor.com/SbfbnhIoLU8AAAAM/scrunched-face.gif',
          likesCount: 10,
        ),
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
        columnCarousel(),
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
        columnCarousel()

      ],
    );
  }
}

Widget columnCarousel() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.all(10), 
        child: CustomFont(
          text: 'Advertisements', 
          fontSize: 18, 
          color: FB_DARK_PRIMARY,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.left,
        )
      ),
      CarouselSlider (
        options: CarouselOptions(
          enableInfiniteScroll: false, height: 308.h, padEnds: false
        ),
        items: carouselItems(),
      ),
    ],
  );
}

List<Widget> carouselItems() {
  return [
    NewsFeed(
      profileImageURL: 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg',
      userName: 'Lark',
      datePosted: 'January 16',
      postText: 'Hello, world!',
      postImageURL: 'https://static1.srcdn.com/wordpress/wp-content/uploads/2023/07/compound-v-only-works-on-children-how-the-boys-breaks-its-own-superpower-rule.jpg',
      likesCount: 10,
      adsMarket: 'hello!',
    ),
    NewsFeed(
      userName: 'Lark',
      datePosted: 'January 16',
      postText: 'Text only',
      likesCount: 10,
       adsMarket: 'hello!',
    ),
    NewsFeed(
       profileImageURL: 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg',
      userName: 'Lark',
      datePosted: 'January 16',
      postText: 'Hello, world!',
      postImageURL: 'https://aphrodite.gmanetwork.com/entertainment/photos/photo/in_photos__the_best_dingdong_dantes_memes_dingdong_mixed_nuts_1578367095.jpg',
      likesCount: 10,
      adsMarket: 'hello!',
    ),
  ];
}
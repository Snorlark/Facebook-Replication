import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/widgets/about.dart';
import 'package:myapp/widgets/photos.dart';
import 'package:myapp/widgets/posts.dart';

class ProfileScreen extends StatefulWidget {

  final String? registeredName;

  const ProfileScreen({super.key, required this.registeredName});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, 
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack (
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      child: CachedNetworkImage(
                        imageUrl: 'https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg',
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, downloadProgress) => 
                          CircularProgressIndicator(
                            color: FB_DARK_PRIMARY,
                            value: downloadProgress.progress,
                          ),
                          errorWidget: (context, url, error) => 
                            Icon(
                              Icons.error,
                              size: 100.sp,
                            ),    
                        ),
                    ),
                    Positioned (
                      bottom: -90,
                      left: ScreenUtil().setWidth(20),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(ScreenUtil().setSp(53)),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(ScreenUtil().setSp(50))
                            ),
                          ),
                          ClipOval(
                            child: CachedNetworkImage(
                            imageUrl:'https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg',
                            fit: BoxFit.cover,
                            width: 100.sp,
                            height: 100.sp,
                            progressIndicatorBuilder:(context, url, downloadProgress) => 
                              CircularProgressIndicator(
                                color: FB_DARK_PRIMARY,
                                value: downloadProgress.progress,
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                size: 50.sp,
                              )
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.grey[300],
                              child: const Icon(
                                Icons.camera_alt,
                                size: 16,
                                color: Colors.black,
                              ),
                            )
                          )
                        ]
                      ),
                    )
                  ]
                ),
                SizedBox(height: ScreenUtil().setHeight(15)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(150)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.registeredName!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      const Text('69 friends')
                    ],
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(15)),
                const TabBar(
                  indicatorColor: Colors.blue,
                  tabs: [
                    Tab(
                      text: 'Posts',
                    ),
                    Tab(
                      text: 'About',
                    ),
                    Tab(
                      text: 'Photos',
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(1000),
                  child: const TabBarView(
                    children: [
                      Posts(),
                      About(),
                      Photos()
                    ]
                  ),
                ),
              ]
            ),
        )
      )
    );
  }
}
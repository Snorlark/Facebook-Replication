import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/screens/detail_screen.dart';
import 'package:myapp/widgets/custom_inkwell_button.dart';
import 'package:myapp/widgets/customfont.dart';

// ignore: must_be_immutable
class NewsFeed extends StatefulWidget {
  final String profileImageURL;
  final String userName;
  final String datePosted;
  final String postText;
  final String postImageURL;
  int likesCount;
  final String adsMarket;

  NewsFeed({
    super.key,
    this.profileImageURL = '',
    required this.userName,
    required this.datePosted,
    required this.postText,
    this.postImageURL = '',
    this.likesCount = 0,
    this.adsMarket = ''
  });

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                (widget.profileImageURL != '')
                    ? ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: widget.profileImageURL,
                        fit: BoxFit.cover,
                        width: 30,
                        height: 30,
                        progressIndicatorBuilder:(context, url, downloadProgress) => 
                          CircularProgressIndicator(
                            color: FB_DARK_PRIMARY,
                            value: downloadProgress.progress,
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            size: 30.sp,
                          )
                      ),
                    )
                    : Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(
                            Radius.circular(ScreenUtil().setSp(20)),
                          ),
                        ),
                        child: const Icon(Icons.person),
                      ),
                SizedBox(width: ScreenUtil().setSp(10)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                    ),
                    Text(
                      widget.datePosted,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: ScreenUtil().setSp(10)),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      userName: widget.userName,
                      postContent: widget.postText,
                      date: widget.datePosted,
                      numOfLikes: widget.likesCount,
                      imageUrl: widget.postImageURL,
                      profileImageUrl: widget.profileImageURL,
                    ),
                  ),
                );
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.postText,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    ),
                    (widget.postImageURL != '')
                        ? Align(
                          alignment: Alignment.center,
                          child: CachedNetworkImage(
                            imageUrl: widget.postImageURL,
                            progressIndicatorBuilder: (context, url, downloadProgress) => 
                              CircularProgressIndicator(
                                color: FB_DARK_PRIMARY,
                                value: downloadProgress.progress,
                              ),
                              errorWidget: (context, url, error) => SizedBox(
                                height: 100.h,
                                width: 100.w,
                                child: const FittedBox( 
                                  fit: BoxFit.contain, 
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                          ),
                        )
                        : SizedBox(height: ScreenUtil().setHeight(0.1)
                    ),
                    SizedBox(height: ScreenUtil().setHeight(5)),
                    (widget.adsMarket != '')
                      ? const SizedBox()
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              print('Liked');
                              setState(() {
                                widget.likesCount++;
                              });
                            },
                            icon: Icon(Icons.thumb_up, color: FB_DARK_PRIMARY,), 
                            label: CustomFont(
                              text: (widget.likesCount == 0)
                                ? 'Like'
                                : widget.likesCount.toString(),
                              fontSize: ScreenUtil().setSp(12),
                              color: FB_DARK_PRIMARY,
                            ),
                          ), 
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.comment, color: FB_DARK_PRIMARY,), 
                            label: CustomFont(
                              text: 'Comment',
                              fontSize: ScreenUtil().setSp(12),
                              color: FB_DARK_PRIMARY,
                            ),
                          ),
                           TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.redo, color: FB_DARK_PRIMARY,), 
                            label: CustomFont(
                              text: 'Share',
                              fontSize: ScreenUtil().setSp(12),
                              color: FB_DARK_PRIMARY,
                            ),
                          ),
                        ],
                      ),
                
                    (widget.adsMarket != '')
                      ? const SizedBox()
                      : Row(
                        children: [
                          const Icon(Icons.person),
                          SizedBox(width: ScreenUtil().setWidth(10),),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(ScreenUtil().setSp(10), 0, 0, 0),
                              alignment: Alignment.centerLeft,
                              height: ScreenUtil().setHeight(25),
                              width: ScreenUtil().setWidth(330),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenUtil().setSp(10))
                                )
                              ),
                              child: CustomFont(
                                text: 'Write a comment..', 
                                fontSize: ScreenUtil().setSp(12), 
                                color: Colors.grey
                              ),
                            ),
                          )
                            
                        ],
                      ),
                
                      (widget.adsMarket != '')
                        ? Container(
                          padding: EdgeInsets.all(5.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFont(
                                    text: 'MORE DETAILS', 
                                    fontSize: 17.sp, 
                                    color: Colors.black
                                  ),
                                  CustomFont(
                                    text: widget.adsMarket, 
                                    fontSize: 17.sp, 
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                              CustomInkwellButton(
                                onTap: () => Navigator.push(
                                  context, 
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      userName: widget.userName, 
                                      postContent: widget.postText, 
                                      date: widget.datePosted,
                                      numOfLikes: widget.likesCount,
                                      imageUrl: widget.postImageURL,
                                      profileImageUrl: widget.profileImageURL,
                                    )
                                  )
                                ), 
                                height: 40.w, 
                                width: 40.h,
                                icon: const Icon(Icons.arrow_right_alt, color: FB_LIGHT_PRIMARY),
                                
                              )
                            ]
                          ),
                        )
                        : const SizedBox(),
                        
                      (widget.adsMarket != '')
                        ? const SizedBox()
                        : SizedBox(height: ScreenUtil().setHeight(10),),
                
                      (widget.adsMarket != '')
                        ? const SizedBox()
                        : CustomFont(text: 'View Comments', fontSize: ScreenUtil().setSp(12), color: Colors.black, fontWeight: FontWeight.bold,)
                
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void incrementLike() {
    setState(() {
      widget.likesCount++;
    });
  }
}

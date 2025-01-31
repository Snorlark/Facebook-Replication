import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/detail_screen.dart';

// ignore: must_be_immutable
class NewsFeed extends StatefulWidget {
  final String profileImageURL;
  final String userName;
  final String datePosted;
  final String postText;
  final String postImageURL;
  int likesCount;

  NewsFeed({
    super.key,
    this.profileImageURL = '',
    required this.userName,
    required this.datePosted,
    required this.postText,
    this.postImageURL = '',
    this.likesCount = 0,
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
                    ? CircleAvatar(
                        radius: ScreenUtil().setSp(20),
                        backgroundImage: NetworkImage(widget.profileImageURL),
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
                      ? SizedBox(
                          width: ScreenUtil().setWidth(500),
                          height: ScreenUtil().setHeight(200),
                          child: Image(
                            image: NetworkImage(widget.postImageURL),
                            fit: BoxFit.cover,
                          ),
                        )
                      : SizedBox(height: ScreenUtil().setHeight(10)),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setSp(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: incrementLike,
                      icon: const Icon(Icons.thumb_up),
                    ),
                    SizedBox(width: ScreenUtil().setSp(5)),
                    Text(widget.likesCount.toString()),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.comment),
                    SizedBox(width: ScreenUtil().setSp(5)),
                    const Text('Comment'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.switch_access_shortcut_add_rounded),
                    SizedBox(width: ScreenUtil().setSp(5)),
                    const Text('Share'),
                  ],
                ),
              ],
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

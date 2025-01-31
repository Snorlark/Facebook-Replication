import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/constants.dart';
import 'package:myapp/widgets/customfont.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  final String userName;
  final String postContent;
  final String date;
  int numOfLikes;
  final String imageUrl;
  final String profileImageUrl;

  DetailScreen({
    super.key, 
    required this.userName, 
    required this.postContent, 
    required this.date, 
    this.numOfLikes = 0,
    this.imageUrl = '', 
    this.profileImageUrl = '',
    });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomFont(
          text: widget.userName,
          fontSize: ScreenUtil().setSp(20),
          color: Colors.black,
        ),
      ),
      body: Container(
        color: Colors.white,
        height: ScreenUtil().setHeight(1000),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    (widget.profileImageUrl == '') 
                      ? const Icon(Icons.person)
                      : CircleAvatar(
                        radius: ScreenUtil().setSp(25),
                        backgroundImage: NetworkImage(widget.profileImageUrl),
                      ),
                    SizedBox(width: ScreenUtil().setWidth(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFont(
                          text: widget.userName, 
                          fontSize: ScreenUtil().setSp(20), 
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomFont(
                              text: widget.date, 
                              fontSize: ScreenUtil().setSp(15), 
                              color: Colors.grey
                            ),
                            SizedBox(width: ScreenUtil().setWidth(3)),
                            Icon(
                              Icons.public,
                              color: Colors.grey,
                              size: ScreenUtil().setSp(18),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.more_horiz)
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(15),),
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                alignment: Alignment.centerLeft,
                child: CustomFont(
                  text: widget.postContent, 
                  fontSize: ScreenUtil().setSp(18), 
                  color: Colors.black
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              (widget.imageUrl == '') ?
                SizedBox(
                  height: ScreenUtil().setHeight(0),
                ) :
                Image.network(widget.imageUrl),
              const Divider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: incrementLike, 
                      icon: const Icon(Icons.thumb_up, color: FB_DARK_PRIMARY,),
                      label: CustomFont(
                        text: (widget.numOfLikes == 0) ? 'Like' : '${widget.numOfLikes}', 
                        fontSize: ScreenUtil().setSp(12), 
                        color: FB_DARK_PRIMARY)
                    ),
                    TextButton.icon(
                      onPressed: (){},
                      icon: const Icon(Icons.comment, color: FB_DARK_PRIMARY,), 
                      label: CustomFont(
                        text: 'Comment', 
                        fontSize: ScreenUtil().setSp(12), 
                        color: FB_DARK_PRIMARY)
                    ),
                    TextButton.icon(
                      onPressed: (){},
                      icon: const Icon(Icons.redo, color: FB_DARK_PRIMARY,), 
                      label: CustomFont(
                        text: 'Share', 
                        fontSize: ScreenUtil().setSp(12), 
                        color: FB_DARK_PRIMARY)
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void incrementLike() {
    setState(() {
      widget.numOfLikes++;
    });
  }
}
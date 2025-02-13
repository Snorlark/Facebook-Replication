import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/detail_screen.dart';
import 'package:myapp/widgets/customfont.dart';

class Notification extends StatelessWidget {

  final String name;
  final String post;
  final String description;
  final Icon icon;
  final String profileImageUrl;
  final String date;
  final int numOfLikes;
  final String imageUrl;
  final bool atProfile;

  const Notification({
    super.key, 
    required this.name, 
    required this.post, 
    required this.description, 
    this.icon = const Icon(Icons.person), 
    this.profileImageUrl = '', 
    required this.date, 
    required this.numOfLikes, 
    this.imageUrl = '', 
    this.atProfile = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setSp(15)),
      child: InkWell(
        onTap: (){
          (atProfile)
            ? print('')
            : Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => 
                DetailScreen(
                  userName: name, 
                  postContent: description, 
                  date: date,
                  numOfLikes: numOfLikes,
                  imageUrl: imageUrl,
                  profileImageUrl: profileImageUrl,
                )
              )
            );
        },
        child: Row(
          children: [
            (profileImageUrl == '')
              ? icon 
              : CircleAvatar(
                radius: ScreenUtil().setSp(15),
                backgroundImage: NetworkImage(profileImageUrl),
              ),
            SizedBox(width: ScreenUtil().setWidth(10),),
            SizedBox(
              width: ScreenUtil().setWidth(300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    text: name, 
                    fontSize: ScreenUtil().setSp(20),
                    color: Colors.black, 
                    fontWeight: FontWeight.w800,
                  ),
                  CustomFont(
                    text: 'Posted: $post', 
                    fontSize: ScreenUtil().setSp(13),
                    color: Colors.black, 
                  ),
                  CustomFont(
                    text: description, 
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.black, 
                    fontStyle: FontStyle.italic,
                  ),
                  SizedBox(height: ScreenUtil().setHeight(5),),
                  CustomFont(
                    text: date, 
                    fontSize: ScreenUtil().setSp(12),
                    color: Colors.grey.shade400, 
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Icon(Icons.more_horiz)
          ],
        ),
      ),
    );
  }
}
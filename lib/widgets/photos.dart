import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(ScreenUtil().setSp(10)),
      children: const <Widget>[
        SizedBox(
          width: double.infinity,
          child: Image(image: NetworkImage('https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg'
          ), fit: BoxFit.cover),
        ),
        SizedBox(
          width: double.infinity,
          child: Image(image: NetworkImage('https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg'
          ), fit: BoxFit.cover),
        ),
        SizedBox(
          width: double.infinity,
          child: Image(image: NetworkImage('https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg'
          ), fit: BoxFit.cover),
        ),

        SizedBox(
          width: double.infinity,
          child: Image(image: NetworkImage('https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg'
          ), fit: BoxFit.cover),
        ),
        SizedBox(
          width: double.infinity,
          child: Image(image: NetworkImage('https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/01/13/jameson-pfeiffer-syndrome.jpg'
          ), fit: BoxFit.cover),
        ),

      ],
    );
  }
}
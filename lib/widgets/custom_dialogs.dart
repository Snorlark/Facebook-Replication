import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/customfont.dart';

import '../constants.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
CustomDialog(BuildContext context, {required title, required content}) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: <Widget>[
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: FB_DARK_PRIMARY, foregroundColor: Colors.white),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Okay')
      ),
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}
customOptionDialog(BuildContext context,
  {required title, required content, required Function onYes}) {
    AlertDialog alertDialog = AlertDialog(
      title: CustomFont(
        text: title,
        fontSize: 30.sp,
      ),
      content: CustomFont(text: content),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const CustomFont(text: 'No'),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: FB_DARK_PRIMARY, foregroundColor: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
              onYes();
            },
          child: const CustomFont(
            text: 'Yes',
            color: FB_TEXT_COLOR_WHITE,
          ),
          ),
      ],
    );
 
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }
 
  customShowImageDialog(BuildContext context, {required String imageUrl}) {
  AlertDialog alertDialog = AlertDialog(
    contentPadding: EdgeInsets.zero,
    content: Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: 300.h,
          padding: EdgeInsets.all(10),
          child: Center(
            child: imageUrl.startsWith('http')
                ? CachedNetworkImage(
                    imageUrl: imageUrl,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(
                      color: FB_DARK_PRIMARY,
                      value: downloadProgress.progress,
                    ),
                    errorWidget: (context, url, error) => Icon(
                      Icons.error,
                      size: 100.sp,
                    ),
                  )
                : Image.asset(imageUrl, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: IconButton(
            icon: Icon(Icons.close, color: Colors.black, size: 24),
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
          ),
        ),
      ],
    ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}

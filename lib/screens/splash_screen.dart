import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/constants.dart';
 
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
 
class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    getIsLogin();
    super.initState();
  }
 
  void getIsLogin() {
    Timer(
      const Duration(seconds: 4),
      () => Navigator.popAndPushNamed(context, '/login'),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          height: ScreenUtil().screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/brocode.png',
              ),
              SizedBox(
                height: ScreenUtil().setHeight(120),
              ),

              const SpinKitWave(
                color: FB_DARK_PRIMARY,
                size: 40.0,)
            ],
          ),
        ),
      ),
    );
  }
}
 
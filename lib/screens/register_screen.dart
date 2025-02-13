import 'package:myapp/widgets/custom_dialogs.dart';

import '../constants.dart';
import 'package:myapp/widgets/custom_inkwell_button.dart';
import 'package:myapp/widgets/custom_textformfield.dart';
import 'package:myapp/widgets/customfont.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobilenumController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  // Function to show validation dialog
  void _showValidationDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Failed'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Function to validate registration fields
  void register() {
  String firstName = firstnameController.text.trim();
  String lastName = lastnameController.text.trim();
  String mobileNum = mobilenumController.text.trim();
  String password = passwordController.text;
  String confirmPassword = confirmpasswordController.text;

  // Strong password regex pattern
  String passwordPattern =
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  RegExp passwordRegExp = RegExp(passwordPattern);

  if (firstName.isEmpty) {
    CustomDialog(context, title: 'Registration Failed', content: 'Please enter your first name');
  } else if (lastName.isEmpty) {
    CustomDialog(context, title: 'Registration Failed', content: 'Please enter your last name');
  } else if (mobileNum.isEmpty || mobileNum.length != 11 || !RegExp(r'^\d{11}$').hasMatch(mobileNum)) {
    CustomDialog(context, title: 'Registration Failed', content: 'Please enter a valid 11-digit mobile number');
  } else if (password.isEmpty) {
    CustomDialog(context, title: 'Registration Failed', content: 'Please enter your password');
  } else if (!passwordRegExp.hasMatch(password)) { 
    CustomDialog(
      context,
      title: 'Registration Failed',
      content: 'Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, a number, and a special character.'
    );
  } else if (password != confirmPassword) {
    CustomDialog(context, title: 'Registration Failed', content: 'Passwords do not match');
  } else {
    String username = "$firstName $lastName";
    CustomDialog(context, title: 'Success', content: 'Registration Successful');
  

  Future.delayed(const Duration(seconds: 2), () {
      Navigator.popAndPushNamed(
        context,
        '/login',
        arguments: {'username': username, 'password': password},
      );
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(25),
            ScreenUtil().setWidth(40),
            ScreenUtil().setWidth(25),
            ScreenUtil().setWidth(10),
          ),
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(25),
              ),
              CustomFont(
                  text: 'Register Here',
                  fontSize: ScreenUtil().setSp(50),
                  fontWeight: FontWeight.bold,
                  color: FB_DARK_PRIMARY),
              SizedBox(
                height: ScreenUtil().setHeight(25),
              ),
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'First name',
                validator: (value) =>
                    value!.isEmpty ? 'Enter your first name' : null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: firstnameController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Last name',
                validator: (value) =>
                    value!.isEmpty ? 'Enter your last name' : null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: lastnameController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                maxLength: 11,
                keyboardType: TextInputType.number,
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Mobile Num',
                validator: (value) => value!.isEmpty || value.length != 11
                    ? 'Enter a valid mobile number'
                    : null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: mobilenumController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                isObscure: true,
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                hintText: 'Password',
                validator: (value) =>
                    value!.isEmpty ? 'Enter your password' : null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: passwordController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Text(
                  '(Password should be 8 characters, a mixture of letter and numbers consisting of at least one special character with Uppercase and Lowercase letters.)',
                  style: TextStyle(
                      color: Colors.black45, fontSize: ScreenUtil().setSp(10))),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomTextFormField(
                isObscure: true,
                hintText: 'Confirm Password',
                height: ScreenUtil().setHeight(10),
                width: ScreenUtil().setWidth(10),
                onSaved: null,
                fontColor: null,
                validator: (value) =>
                    value!.isEmpty ? 'Confirm your password' : null,
                hintTextSize: ScreenUtil().setSp(15),
                fontSize: ScreenUtil().setSp(15),
                controller: confirmpasswordController,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You have an account? ',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: ScreenUtil().setSp(15))),
                  GestureDetector(
                    onTap: () => Navigator.popAndPushNamed(context, '/login'),
                    child: Text(
                      'Login here',
                      style: TextStyle(
                        color: FB_DARK_PRIMARY,
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              CustomInkwellButton(
                onTap: () => register(),
                height: ScreenUtil().setHeight(45),
                width: ScreenUtil().screenWidth,
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.bold,
                buttonName: 'Submit'
              ),
            ],
          ),
        ),
      ),
    );
  }
}

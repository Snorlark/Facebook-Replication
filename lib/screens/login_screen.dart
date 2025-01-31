import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/widgets/custom_textformfield.dart';
import '../constants.dart';
import '../widgets/custom_dialogs.dart';
import '../widgets/custom_inkwell_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LogInScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? registeredUsername;
  String? registeredPassword;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Get username and password passed from Register Screen
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      registeredUsername = args['username'];
      registeredPassword = args['password'];
    }
  }

  void _login() {
  if (usernameController.text.trim() == registeredUsername &&
      passwordController.text == registeredPassword) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(registeredName: registeredUsername),
      ),
    );
  } else {
    CustomDialog(context, title: 'Login Failed', content: 'Invalid username or password.');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/fakebook.png',
                        height: ScreenUtil().setHeight(100),
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: usernameController,
                        validator: (value) => value!.isEmpty ? 'Enter your Username' : null,
                        onSaved: (value) => usernameController.text = value!,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: FB_DARK_PRIMARY,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Username',
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: passwordController,
                        isObscure: true,
                        validator: (value) => value!.isEmpty ? 'Enter your Password' : null,
                        onSaved: (value) => passwordController.text = value!,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: FB_DARK_PRIMARY,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Password',
                      ),
                      SizedBox(height: ScreenUtil().setHeight(50)),
                      CustomInkwellButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _login();
                          } else {
                            // If form is invalid, show dialog
                            CustomDialog(context, title: 'Login Failed', content: 'Please fill in all fields');
                          }
                        },
                        height: ScreenUtil().setHeight(40),
                        width: ScreenUtil().screenWidth,
                        buttonName: 'Login',
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('You do not have an account? ',
                          style: TextStyle(
                              color: Colors.grey.shade200,
                              fontSize: ScreenUtil().setSp(15))),
                      GestureDetector(
                        onTap: () =>
                            Navigator.popAndPushNamed(context, '/register'),
                        child: Text(
                          'Register here',
                          style: TextStyle(
                            color: FB_LIGHT_PRIMARY,
                            fontSize: ScreenUtil().setSp(15),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

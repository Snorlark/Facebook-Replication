import 'package:flutter/material.dart';
import 'package:myapp/screens/newsfeed_screen.dart';
import 'package:myapp/screens/notification_screen.dart';
import 'package:myapp/screens/profile_screen.dart';
import 'package:myapp/widgets/show_dialog.dart';

class HomeScreen extends StatefulWidget {

  final String? registeredName;

  const HomeScreen({super.key, required this.registeredName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int _currentIndex = 0;
  String appBarTitle = '';
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {

    switch(_currentIndex) {
      case 0: appBarTitle = 'Pisbok';
        break;
      case 1: appBarTitle = 'Notifications';
        break;
      case 2: appBarTitle = widget.registeredName!;
        break;
    }
          
    return Scaffold(
      
      //AppBar
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 2,
        backgroundColor: Colors.blue,
        centerTitle: false,
        titleSpacing: 20,
        title: Text(
          appBarTitle,
          style: const TextStyle(
            fontSize: 20, 
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily:'Verdana'
          )
        ),
        actions:  [
          (_currentIndex == 2) ?
          IconButton(
            onPressed: () => {const ShowDialog().showAlertDialog(context)}, 
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
          : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle, color: Colors.white)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.white)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.chat, color: Colors.white)),
            ]
          )
        ]
      ),

      //Body
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          const NewsFeedScreen(),
          const NotificationScreen(),
          ProfileScreen(registeredName: widget.registeredName,)
        ],
        onPageChanged: (page) {
          setState(() {
            _currentIndex = page;
          });
        },
      ),

      //Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.blue,
        onTap: _onTappedBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: 'Notification'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile'
          ),
        ],
      selectedItemColor: Colors.blue[100],
      currentIndex: _currentIndex,
      )

    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _currentIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
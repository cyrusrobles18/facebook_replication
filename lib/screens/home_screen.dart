import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import '../screens/newsfeed_screen.dart';
import '../widgets/custom_font.dart';
import '../screens/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: FB_TEXT_COLOR_WHITE,
        elevation: 2,
        title: _selectedIndex == 0
            ? CustomFont(
                text: 'facebook',
                fontSize: ScreenUtil().setSp(25),
                color: FB_PRIMARY,
                fontFamily: 'Klavika',
              )
            : CustomFont(
                text: 'Notifications',
                fontSize: ScreenUtil().setSp(25),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
      ),
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          NewsFeedScreen(),
          NotificationScreen(),
        ],
        onPageChanged: (page) {
          setState(
            () {
              _selectedIndex = page;
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, //selected item
        showUnselectedLabels: false, //unselected item
        onTap: _onTappedBar,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: FB_PRIMARY,
        currentIndex: _selectedIndex,
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}

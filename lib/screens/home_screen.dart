import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/profile_screen.dart';
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
        backgroundColor: FB_DARK_PRIMARY,
        elevation: 2,
        title: (_selectedIndex == 0)
            ? CustomFont(
                text: 'CCITBook',
                fontSize: ScreenUtil().setSp(25),
                fontFamily: 'Klavika',
                color: FB_LIGHT_PRIMARY)
            : (_selectedIndex == 2)
                ? CustomFont(
                    text: 'Cyrus Robles',
                    fontSize: ScreenUtil().setSp(25),
                    fontWeight: FontWeight.bold,
                    color: FB_LIGHT_PRIMARY)
                : CustomFont(
                    text: 'Notification',
                    fontSize: ScreenUtil().setSp(25),
                    fontWeight: FontWeight.bold,
                    color: FB_LIGHT_PRIMARY),
        actions: [
          TextButton(onPressed: () => print('Logout'), child: Text('LOGOUT')),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: const <Widget>[
          NewsFeedScreen(),
          NotificationScreen(),
          ProfileScreen()
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
        backgroundColor: FB_DARK_PRIMARY,
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
        selectedItemColor: FB_SECONDARY,
        unselectedItemColor: FB_LIGHT_PRIMARY,
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

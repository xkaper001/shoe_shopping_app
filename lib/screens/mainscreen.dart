import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shoe_shopping_app/constants/palette.dart';
import 'search.dart';
import 'home.dart';
import 'notifications.dart';
import 'profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: PageView(
            children: _screens,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          bottomNavigationBar: GNav(
            selectedIndex: _currentIndex,
            backgroundColor: Palette.grey,
            color: Palette.iconColor,
            activeColor: Palette.iconColor,
            haptic: true,
            gap: 8,
            iconSize: 22,
            textSize: 12,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            tabs: const <GButton>[
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Notifications',
              ),
              GButton(icon: Icons.person, text: 'Profile',)
            ],
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:onecart_user_app/Screens/profile_screen/profile_screen.dart';
import '../../configs/app_color.dart';
import '../../configs/app_dimensions.dart';
import '../home/home_screen.dart';

class RootScreen extends StatefulWidget {
  static const routeName = 'RootScreen';

  const RootScreen({
    super.key,
  });

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  static int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List _widgetOptions = [
    HomeScreen(),
    Text('Index 1: Orders'),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
        bottomNavigationBar: Container(
          height: kBottomNavBarHeight,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kBottomNavBarRadius),
                  topRight: Radius.circular(kBottomNavBarRadius)),
              boxShadow: [
                BoxShadow(
                  color: AppColor.grey,
                  spreadRadius: 1,
                  blurRadius: kBottomNavBarRadius,
                ),
              ]),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(kBottomNavBarRadius),
                topRight: Radius.circular(kBottomNavBarRadius)),
            child: BottomNavigationBar(
              enableFeedback: true,
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.my_library_books), label: 'Orders'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Account')
              ],
            ),
          ),
        ));
  }
}

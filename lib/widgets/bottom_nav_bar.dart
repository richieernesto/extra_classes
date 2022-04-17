import 'package:flutter/material.dart';
import '../screens/courses_screen.dart';
import '../screens/my_courses_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/settings_screen.dart';

class CustomBottomNavigator extends StatefulWidget {
  @override
  State<CustomBottomNavigator> createState() => _CustomButtomNavigator();
}

class _CustomButtomNavigator extends State<CustomBottomNavigator> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CoursesScreen(),
    MyCoursesScreen(),
    SettingsScreen(),
    CartScreen()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_online_sharp), label: "My Courses"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped),
    );
  }
}

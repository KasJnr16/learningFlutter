import 'package:campusstore/models/user.dart';
import 'package:flutter/material.dart';
import 'package:campusstore/widgets/home/appFeedWidget.dart';
import 'package:campusstore/widgets/home/profileWidget.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final User user;

  const MyBottomNavigationBar({Key? key, required this.user}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;
  PageController pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          FeedWidget(user: widget.user),
          Center(child: Text('Shopping Widget Placeholder')),
          Center(child: Text('My Store Widget Placeholder')),
          ProfileWidget(user: widget.user),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        selectedFontSize: 16,
        unselectedFontSize: 0,
        iconSize: 40,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: _selectedIndex == 0 ? 45 : 40,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopify_sharp,
              size: _selectedIndex == 1 ? 45 : 40,
            ),
            label: "Shopping Bag",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.storefront_sharp,
              size: _selectedIndex == 2 ? 45 : 40,
            ),
            label: "My Store",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: _selectedIndex == 3 ? 45 : 40,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

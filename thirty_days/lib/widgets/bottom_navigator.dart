import 'package:flutter/material.dart';
import 'package:thirty_days/widgets/alert.dart';
import 'package:thirty_days/widgets/dismissable.dart';
import 'package:thirty_days/widgets/row_column.dart';
import 'package:thirty_days/widgets/snackbar.dart';

class BottomNavigatorWidget extends StatefulWidget {
  const BottomNavigatorWidget({super.key});

  @override
  State<BottomNavigatorWidget> createState() => _BottomNavigatorWidgetState();
}

class _BottomNavigatorWidgetState extends State<BottomNavigatorWidget> {
  int selectedIndex = 0;

  // List<Widget> widgets = const [
  //   Text("Home"),
  //   Text("Search"),
  //   Text("Add"),
  //   Text("Profile")
  // ];

  PageController pageController = PageController();

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(child: widgets.elementAt(selectedIndex)),
      body: PageView(controller: pageController, children: const [
        AlertWidget(),
        DismissableWidegt(),
        RowsCols(),
        SnackBarWidget(),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      ),
    );
  }
}

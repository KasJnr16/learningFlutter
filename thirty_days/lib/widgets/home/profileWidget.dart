import 'package:flutter/material.dart';
import 'package:thirty_days/models/user.dart';

class ProfileWidget extends StatefulWidget {
  final User user;

  const ProfileWidget({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  bool isHeartPressed = false; // Toggle for heart icon

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // Expand the height
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.user.username,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          leading: _buildIconButton(Icons.menu, onTap: () {
            // Handle the leading icon action (e.g., open a drawer)
          }),
          actions: [
            _buildHeartIcon(), // Heart icon with toggle behavior
            _buildIconButton(Icons.notifications, onTap: () {
              // Handle notification action
            }),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }

  // Build the heart icon with toggle functionality
  Widget _buildHeartIcon() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            isHeartPressed = !isHeartPressed;
          });
        },
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade300, // Barely visible outline
              width: 1.5,
            ),
          ),
          child: Icon(
            isHeartPressed ? Icons.favorite : Icons.favorite_outline,
            color: isHeartPressed
                ? Colors.red
                : Colors.black, // Toggle between red and black
            size: 28,
          ),
        ),
      ),
    );
  }

  // Generic method to build icon buttons with outlined style
  Widget _buildIconButton(IconData icon, {required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade300, // Barely visible outline
              width: 1.5,
            ),
          ),
          child: Icon(
            icon,
            color: Colors.black, // Black icon color
            size: 28,
          ),
        ),
      ),
    );
  }
}

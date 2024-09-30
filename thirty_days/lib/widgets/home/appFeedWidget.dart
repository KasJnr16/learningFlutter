import 'package:flutter/material.dart';
import 'package:thirty_days/models/user.dart';
import 'package:thirty_days/widgets/home/recommendWidget.dart';
import '../utils/categoriesWidget.dart'; // Assuming this is in your project

class FeedWidget extends StatefulWidget {
  final User user;

  const FeedWidget({Key? key, required this.user}) : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        appName: "CampuStores", // Your app name
        profileImageUrl:
            widget.user.profilePicture?.imageUrl, // Profile picture URL
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Divider(),
            SearchBarWidget(),
            Expanded(
              child: ListView(
                children: [
                  ProductCardWidget(width: w),
                  CategoryButton(width: 60),
                  CategoriesWidget(),
                  Divider(), // Horizontal categories widget
                  RecommendedWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Profile header widget with icon, text, and profile picture
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appName;
  final String? profileImageUrl; // URL or asset for the profile picture

  const CustomAppBar({
    Key? key,
    required this.appName,
    this.profileImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Icon(
          Icons.shopping_bag_rounded, // Purple basket icon
          color: Colors.purple, // Make the basket purple
          size: 50, // Make the icon large
        ),
      ),
      title: Text(
        appName, // Display app name
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 28, // Make the text larger and bold
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            radius: 25, // Make the profile picture larger
            backgroundColor: Colors.grey.shade300,
            backgroundImage: profileImageUrl != null
                ? NetworkImage(profileImageUrl!)
                : AssetImage("assets/jeans.png"), // Profile picture
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80); // Adjust app bar height
}

// Search bar widget
class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: Colors.black45,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 80,
      // color: Colors.amber,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(fontSize: 21, color: Colors.grey.shade600),
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 35),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: EdgeInsets.symmetric(vertical: 15),
        ),
      ),
    );
  }
}

//Ad Card widget with an image background
class ProductCardWidget extends StatelessWidget {
  final double width;

  const ProductCardWidget({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 25, left: 25, bottom: 25),
      height: 320,
      width: width,
      child: Stack(
        children: [
          Positioned.fill(
            top: 10,
            bottom: 5,
            right: 10,
            left: 10,
            child: Image.asset(
              'assets/jeans.png', // Replace with your image
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: width,
            child: Card(
              elevation: 10,
              color: Colors.black45.withOpacity(0.6),
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Where Shopping and Selling Meet Convenience",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Buy what you love, sell what you have, all in one place",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Button that shows the bottom sheet with categories
class CategoryButton extends StatelessWidget {
  final double width;

  const CategoryButton({required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.only(left: 25),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 170,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10), // Adjusts padding around the text and icon
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Makes the button slightly rounded
                ),
                backgroundColor:
                    Colors.white, // Background color for the button
                elevation: 5, // Optional: Adds a bit of shadow
              ),
              onPressed: () => showModalBottomSheet(
                context: context,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50.0)),
                ),
                backgroundColor: Colors.grey.shade300,
                builder: (BuildContext context) {
                  return BottomSheetCategory();
                },
              ),
              child: Row(
                mainAxisSize: MainAxisSize
                    .min, // Shrinks the button to fit around its content
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Bottom sheet widget for categories
class BottomSheetCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Adjust to content size
        children: <Widget>[
          Icon(Icons.drag_handle_sharp, size: 30),
          Divider(),
          buildListTile(
            icon: Icons.shopping_bag_outlined,
            title: 'Clothing',
            context: context,
            onTap: () => print("Clothing tapped"),
          ),
          SizedBox(height: 10),
          buildListTile(
            icon: Icons.laptop,
            title: 'Electronics',
            context: context,
            onTap: () => print("Electronics tapped"),
          ),
          SizedBox(height: 10),
          buildListTile(
            icon: Icons.home_outlined,
            title: 'Home and Garden',
            context: context,
            onTap: () => print("Home and Garden tapped"),
          ),
          SizedBox(height: 10),
          buildListTile(
            icon: Icons.health_and_safety_outlined,
            title: 'Health and Beauty',
            context: context,
            onTap: () => print("Health and Beauty tapped"),
          ),
          SizedBox(height: 10),
          buildListTile(
            icon: Icons.toys_outlined,
            title: 'Toys and Games',
            context: context,
            onTap: () => print("Toys and Games tapped"),
          ),
          SizedBox(height: 10),
          buildListTile(
            icon: Icons.menu_book_sharp,
            title: 'Books and Media',
            context: context,
            onTap: () => print("Books and Media tapped"),
          ),
        ],
      ),
    );
  }

  // Reusable method for building ListTile
  Widget buildListTile({
    required IconData icon,
    required String title,
    required BuildContext context,
    required Function onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 30),
      title: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.grey.shade700),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 30, color: Colors.grey),
      onTap: () {
        onTap();
        Navigator.pop(context); // Close the bottom sheet
      },
    );
  }
}

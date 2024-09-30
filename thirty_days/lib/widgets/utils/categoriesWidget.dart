import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  @override
  _CategoriesWidgetState createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int selectedIndex = 0; // Default selected category index

  // List of category names
  final List<String> categories = [
    'All',
    'Fashion',
    'Electronics',
    'Books',
    'Home and Kitchen',
    'Accessories'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(categories.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ChoiceChip(
                label: Text(
                  categories[index],
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                selected: selectedIndex == index,
                onSelected: (bool isSelected) {
                  setState(() {
                    selectedIndex = index;
                  });
                  // Handle category selection logic here
                },
                selectedColor: Colors.grey.shade500,
                backgroundColor: Colors.grey.shade200,
                labelPadding: EdgeInsets.symmetric(horizontal: 15.0),
              ),
            );
          }),
        ),
      ),
    );
  }
}

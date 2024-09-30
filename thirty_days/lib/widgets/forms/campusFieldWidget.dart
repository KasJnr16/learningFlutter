import 'package:flutter/material.dart';

class CampusDropdown extends StatefulWidget {
  final Function(String?) onSaved; // Callback function for saving campus

  CampusDropdown({required this.onSaved});

  @override
  _CampusDropdownState createState() => _CampusDropdownState();
}

class _CampusDropdownState extends State<CampusDropdown> {
  String? campusName;

  final List<String> campuses = [
    'Ho Technical University',
    'Accra Technical University',
    'UHAS',
    'UPSA',
    'University of Ghana',
    'KNUST',
    'KTU'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      key: ValueKey("campusName"),
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 21),
        hintText: "Select your campus",
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
              BorderSide(color: Colors.black, width: 2), // Blue border on focus
        ),
      ),
      value: campusName, // Initial value for the dropdown
      onChanged: (String? newValue) {
        setState(() {
          campusName = newValue;
        });
      },
      items: campuses.map<DropdownMenuItem<String>>((String campus) {
        return DropdownMenuItem<String>(
          value: campus,
          child: Text(
            campus,
            style: TextStyle(fontSize: 21),
          ),
        );
      }).toList(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please select a campus";
        }
        return null;
      },
      onSaved: (value) {
        // Pass the selected value to the parent via the callback
        widget.onSaved(value);
      },
      dropdownColor:
          Colors.grey.shade400, // Background color of the dropdown list
      style: TextStyle(fontSize: 18, color: Colors.black),
      elevation: 5,

      iconSize: 30,
    );
  }
}

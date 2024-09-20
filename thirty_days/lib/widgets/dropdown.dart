import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({super.key});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String selectedValue = "Orange";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DropDown List"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 70,
            // color: Colors.amber,
            width: MediaQuery.of(context).size.width,
            child: DropdownButton<String>(
                dropdownColor: Colors.grey.shade200,
                value: selectedValue,
                isExpanded: true,
                icon: const Icon(Icons.arrow_circle_down_rounded),
                items: <String>["Orange", "Apple", "Banana", "Mango"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                }),
          )
        ],
      ),
    );
  }
}

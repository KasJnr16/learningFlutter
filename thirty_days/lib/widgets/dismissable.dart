import 'package:flutter/material.dart';

class DismissableWidegt extends StatefulWidget {
  const DismissableWidegt({super.key});

  @override
  State<DismissableWidegt> createState() => _DismissableWidegtState();
}

class _DismissableWidegtState extends State<DismissableWidegt> {
  List<String> fruits = ["Mango", "Banana", "Apple", "Grapes"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dismissable Package"),
      ),
      body: ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            final fruit = fruits[index];
            return Dismissible(
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Deleted",
                      style: TextStyle(fontSize: 20),
                    ),
                    backgroundColor: Colors.red,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Achived",
                      style: TextStyle(fontSize: 20),
                    ),
                    backgroundColor: Colors.green,
                  ));
                }
              },
              key: Key(fruit),
              background: Container(
                color: Colors.red,
              ),
              secondaryBackground: Container(
                color: Colors.green,
              ),
              child: Card(
                child: ListTile(
                  title: Text(fruits[index]),
                ),
              ),
            );
          }),
    );
  }
}

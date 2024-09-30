import 'package:flutter/material.dart';

class ListGrid extends StatefulWidget {
  const ListGrid({super.key});

  @override
  State<ListGrid> createState() => _ListGridState();
}

class _ListGridState extends State<ListGrid> {
  List<String> fruits = ["Orange", "Mango", "Apple", "Banana"];
  Map fruits_person = {
    "fruits": ["Orange", "Mango", "Apple", "Banana"],
    "names": ["Kassim", "David", "Macc", "Folley"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "List and Grid",
        ),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      // body: Container(
      //   child: ListView.builder(
      //       itemCount: fruits.length,
      //       itemBuilder: (context, index) {
      //         return Card(
      //           child: ListTile(
      //             leading: const Icon(Icons.person),
      //             title: Text(fruits_person['fruits'][index]),
      //             subtitle: Text(fruits_person['names'][index]),
      //           ),
      //         );
      //       }),
      // )
      body: Container(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            return Card(
              child: GridTile(
                child: Center(
                  child: Text(fruits_person["fruits"][index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

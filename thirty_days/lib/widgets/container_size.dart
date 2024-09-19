import 'package:flutter/material.dart';

class ContainerSized extends StatelessWidget {
  const ContainerSized({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container and Size Box"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(15),
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20, spreadRadius: 5, color: Colors.black)
                ]),
            child: Center(
              child: Container(
                color: Colors.red,
              ),
              // child: Text(
              //   "Hello",
              //   style: TextStyle(fontSize: 20),
              // ),
            )),
      ),
    );
  }
}

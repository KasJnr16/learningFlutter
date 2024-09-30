import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snack Bar"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  action: SnackBarAction(
                    label: "Undo",
                    textColor: Colors.blue,
                    onPressed: () => {},
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  behavior: SnackBarBehavior.floating,
                  content: const Text(
                    "This is a wrong credentials",
                    style: TextStyle(fontSize: 20),
                  ),
                  duration: const Duration(seconds: 15),
                  backgroundColor: const Color.fromARGB(255, 190, 183, 183),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text("Snack Bar")),
        ),
      ),
    );
  }
}

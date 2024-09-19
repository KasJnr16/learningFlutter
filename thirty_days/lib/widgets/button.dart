import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: const ButtonStyle(
                  elevation: WidgetStatePropertyAll(20),
                  overlayColor: WidgetStatePropertyAll(Colors.black),
                  backgroundColor: WidgetStatePropertyAll(Colors.yellow)),
              onPressed: () => {},
              child: const Text(
                "Press me",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(Colors.blue),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  onPressed: () => {print("like")},
                  child: const Text(
                    "Press me",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

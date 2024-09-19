import 'package:flutter/material.dart';

class AlertWidget extends StatelessWidget {
  const AlertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _showMyDialog(context);
            },
            child: const Text("Show Alert")),
      ),
    );
  }
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: Colors.black,
          elevation: 0,
          scrollable: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Text("This is an alert"),
          content: const SingleChildScrollView(
            child: ListBody(
              children: [Text("This is a demo"), Text("This is Junior's")],
            ),
          ),
          actions: [
            TextButton(onPressed: () {}, child: Text("Approve")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancel"))
          ],
        );
      });
}

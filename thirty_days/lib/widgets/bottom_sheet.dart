import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bottom Sheet",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.orange),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)))),
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  isDismissible: true,
                  enableDrag: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  context: context,
                  builder: (context) {
                    return const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text("Orange"),
                          subtitle: Text("Me"),
                        ),
                        ListTile(
                          title: Text("Orange"),
                          subtitle: Text("Me"),
                        ),
                        ListTile(
                          title: Text("Orange"),
                          subtitle: Text("Me"),
                        ),
                        ListTile(
                          title: Text("Orange"),
                          subtitle: Text("Me"),
                        ),
                        ListTile(
                          title: Text("Orange"),
                          subtitle: Text("Me"),
                        )
                      ],
                    );
                  });
            },
            child: const Text("Show bottom sheet",
                style: TextStyle(color: Colors.white, fontSize: 15))),
      ),
    );
  }
}

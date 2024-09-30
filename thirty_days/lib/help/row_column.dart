import 'package:flutter/material.dart';

class RowsCols extends StatelessWidget {
  const RowsCols({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Rows and Cols"),
      ),
      // // body: Container(
      // //   height: h,
      // //   width: w,
      // //   color: Colors.yellow,
      // //   child: Row(
      // //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // //     crossAxisAlignment: CrossAxisAlignment.center,

      // //     // For Wrap(
      // //     // direction: Axis.vertical, //how you want the level to be arranged
      // //     // alignment: WrapAlignment.spaceBetween
      // //     // )

      // //     children: <Widget>[
      // //       Container(
      // //         height: 60,
      // //         width: 60,
      // //         color: Colors.red,
      // //       ),
      // //       Container(
      // //         height: 60,
      // //         width: 60,
      // //         color: Colors.green,
      // //       ),
      // //       Container(
      // //         height: 60,
      // //         width: 60,
      // //         color: Colors.purple,
      // //       ),
      // //       Container(
      // //         height: 60,
      // //         width: 60,
      // //         color: Colors.black,
      // //       ),
      // //       Container(
      // //         height: 60,
      // //         width: 60,
      // //         color: Colors.orange,
      // //       ),
      // //     ],
      // //   ),
      // ),
      body: Container(
        height: h,
        width: w,
        color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              color: Colors.red,
            ),
            Container(
              height: 60,
              width: 60,
              color: Colors.green,
            ),
            Container(
              height: 60,
              width: 60,
              color: Colors.purple,
            ),
            Container(
              height: 60,
              width: 60,
              color: Colors.black,
            ),
            Container(
              height: 60,
              width: 60,
              color: Colors.orange,
            )
          ],
        ),
      ),
    );
  }
}

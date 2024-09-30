import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.yellow,
                    image: DecorationImage(
                        image: AssetImage('assets/sacksforpre.png'),
                        fit: BoxFit.cover)),
              )),
              Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.grey.shade100,
                    child: const Icon(
                      Icons.heart_broken,
                      size: 40,
                      
                    ),
                  )),
              //Playimg with
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                ),
              ),
              Center(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

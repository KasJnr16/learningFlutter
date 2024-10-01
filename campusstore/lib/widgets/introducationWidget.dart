import 'package:campusstore/widgets/forms/authWidget.dart';
import 'package:flutter/material.dart';

class IntroducationWidget extends StatefulWidget {
  const IntroducationWidget({super.key});

  @override
  State<IntroducationWidget> createState() => _IntroducationWidgetState();
}

class _IntroducationWidgetState extends State<IntroducationWidget> {
  int isNext = 0;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        child: Stack(
          children: [
            // Conditional image based on the current value of isNext
            Positioned(
              child: Container(
                height: h * 0.65,
                width: w,
                // color: Colors.white,
                child: isNext == 0
                    ? Image.asset(
                        "assets/pixlr-image-generator-c5034831-c385-4d20-82f8-570428ebbb0c.png",
                        fit: BoxFit.cover,
                      )
                    : isNext == 1
                        ? Image.asset(
                            "assets/pixlr-image-generator-67e41f7b-9254-4f4b-9899-94ee9ab1dcb4.png",
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            "assets/pixlr-image-generator-fc9de4f7-563a-4fe6-ba1f-a9bd6108e716.png",
                            fit: BoxFit.cover,
                          ),
              ),
            ),
            Positioned(
              top: h * 0.5,
              bottom: 0,
              child: Container(
                height: h * 0.5,
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 5,
                      color: Colors.black,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isNext == 0
                                ? Icons.circle_rounded
                                : Icons.circle_outlined,
                            size: 20,
                          ),
                          Icon(
                            isNext == 1
                                ? Icons.circle_rounded
                                : Icons.circle_outlined,
                            size: 20,
                          ),
                          Icon(
                            isNext == 2
                                ? Icons.circle_rounded
                                : Icons.circle_outlined,
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      // Conditional text based on isNext
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          isNext == 0
                              ? "Welcome to Your Campus Marketplace"
                              : isNext == 1
                                  ? "Save and Make Money, All in One Place"
                                  : "Connect with Campus Communities",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      // Conditional description text based on isNext
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Text(
                          isNext == 0
                              ? "Experience the ease of a marketplace tailored to help you buy and sell anything you need, connecting multiple campuses effortlessly."
                              : isNext == 1
                                  ? "Save money on textbooks, gadgets, and more. Have items you no longer need? Turn them into cash by listing them for sale."
                                  : "Whether you're buying or selling, rest assured that your transactions are secure, backed by a trustworthy and supportive community.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 21,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      // Next or Get Started button
                      Container(
                        width: 280,
                        height: 70,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: WidgetStateProperty.all(10),
                            backgroundColor:
                                WidgetStateProperty.resolveWith<Color>(
                              (states) {
                                if (states.contains(WidgetState.pressed)) {
                                  return Colors.black12; // Color when pressed
                                }
                                return Colors.black; // Default color
                              },
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (isNext < 2) {
                                isNext += 1;
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            UserAuthWidget()));
                              }
                            });
                          },
                          child: Text(
                            isNext < 2 ? "Next" : "Get Started",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      // Skip or Back button
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isNext == 0
                                ? Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserAuthWidget()))
                                : isNext > 0
                                    ? isNext -= 1
                                    : null; // Decrement to go back
                          });
                        },
                        child: Text(
                          isNext == 0 ? "Skip" : "Back",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

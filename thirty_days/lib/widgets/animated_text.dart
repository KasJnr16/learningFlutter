import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animated Text",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // AnimatedTextKit(
            //   animatedTexts: [
            //     TypewriterAnimatedText("Kassim Abdulai Jnr",
            //         textStyle:
            //             TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            //         speed: Duration(milliseconds: 300))
            //   ],
            //   totalRepeatCount: 4,
            //   pause: Duration(milliseconds: 200),
            //   displayFullTextOnTap: true,
            //   stopPauseOnTap: true,
            // ),
            AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText(
                  "Hello",
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                RotateAnimatedText(
                  "World",
                  textStyle: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

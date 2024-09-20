import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Images"),
      ),
      body: Center(
          child: SizedBox(
        height: 300,
        width: 250,
        child: CachedNetworkImage(
          imageUrl:
              'https://images.pexels.com/photos/1183434/pexels-photo-1183434.jpeg?cs=srgb&dl=pexels-amir-1183434.jpg&fm=jpg',
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        // decoration: BoxDecoration(
        //     boxShadow: [
        //       BoxShadow(blurRadius: 10, color: Colors.black, spreadRadius: 5.0)
        //     ],
        //     image: DecorationImage(
        //       image: AssetImage(
        //         "assets/sacksforpre.png",
        //         // image: NetworkImage(
        //         //   "https://thumbs.dreamstime.com/b/funny-face-baby-27701492.jpg",
        //       ),
        //       fit: BoxFit.cover,
        //     ),
        //     borderRadius: BorderRadius.circular(20)),
      )),
    );
  }
}

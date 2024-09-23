import 'package:flutter/material.dart';

class CloneUi extends StatefulWidget {
  const CloneUi({super.key});

  @override
  State<CloneUi> createState() => _CloneUiState();
}

class _CloneUiState extends State<CloneUi> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: w,
        height: h,
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 490,
                    // color: Colors.yellow,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Container(
                          height: 445,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://images.squarespace-cdn.com/content/v1/57f4717846c3c46d4a4bf475/1668120993782-30TW7O8IRN1QSD6LQT88/IMG_7700.JPG"))),
                        )),
                        const Positioned(
                            bottom: 0,
                            right: 15,
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(
                                  "https://preview.redd.it/created-random-people-using-chatgpt-midjourney-do-you-know-v0-q1aa450i5dqb1.png?width=640&crop=smart&auto=webp&s=d87cecc44334f13e584bc273c5fd27d7318643c0"),
                            )),
                        Positioned(
                            top: 35,
                            left: 25,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                    backgroundColor:
                                        const WidgetStatePropertyAll(
                                            Color.fromARGB(0, 102, 102, 102))),
                                child: const Icon(
                                  Icons.arrow_back_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ))),
                        Positioned(
                            top: 35,
                            right: 25,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: const ButtonStyle(
                                    backgroundColor:
                                        const WidgetStatePropertyAll(
                                            Color.fromARGB(0, 102, 102, 102))),
                                child: const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.white,
                                  size: 30,
                                )))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              width: w,
              // color: Colors.blue,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Abdulai Kassim Jnr",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Tag line",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: w,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                        child: rowIconText("20",
                            icon: Icons.favorite_outline_rounded)),
                    Card(
                        child: rowIconText("34",
                            icon: Icons.file_upload_outlined)),
                    Card(
                        child: rowIconText("82", icon: Icons.message_outlined)),
                    Card(
                        child:
                            rowIconText("295", icon: Icons.person_2_outlined)),
                  ],
                )),
            Divider(),
            Container(
              padding: EdgeInsets.all(25),
              child: const Text(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            )
          ],
        ),
      ),
    );
  }
}

Widget rowIconText(String text, {required IconData icon}) {
  return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 5),
          Icon(icon)
        ],
      ));
}

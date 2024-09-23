import 'package:flutter/material.dart';

class CloneMainWidget extends StatelessWidget {
  const CloneMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_outlined,
          size: 25,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Koff.S",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 230,
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  // color: Colors.amber,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            "https://preview.redd.it/created-random-people-using-chatgpt-midjourney-do-you-know-v0-q1aa450i5dqb1.png?width=640&crop=smart&auto=webp&s=d87cecc44334f13e584bc273c5fd27d7318643c0"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Koff.S",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Links//http",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 19, 112, 188)),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.purple,
                    child: Column(
                      children: [
                        Container(
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              profileDetails("150", "Posts"),
                              const SizedBox(
                                width: 10,
                              ),
                              profileDetails("5k", "Followers"),
                              const SizedBox(
                                width: 10,
                              ),
                              profileDetails("100", "Following"),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                            children: [
                              Expanded(
                                  // color: Colors.amber,
                                  child: Container(
                                      height: 50,
                                      child: ElevatedButton(
                                          style: const ButtonStyle(
                                              elevation:
                                                  WidgetStatePropertyAll(5),
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                      Colors.blue)),
                                          onPressed: () {},
                                          child: const Text(
                                            "Follow",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          )))),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue, width: 2),
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.arrow_drop_down_outlined,
                                    size: 30,
                                    color: Colors.blue,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // Divider(),
          Container(
            height: 150,
            // color: Colors.yellow,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurStyle: BlurStyle.outer, blurRadius: 10)
                          ],
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://images.squarespace-cdn.com/content/v1/57f4717846c3c46d4a4bf475/1668120993782-30TW7O8IRN1QSD6LQT88/IMG_7700.JPG"),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                          color: Colors.grey.shade900),
                    ),
                    Text("Title")
                  ],
                );
              },
            ),
          ),
          Divider(),
          // Container(
          //   height: 100,
          //   color: Colors.blue,
          // ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(10),
            // color: Colors.green,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://images.squarespace-cdn.com/content/v1/57f4717846c3c46d4a4bf475/1668120993782-30TW7O8IRN1QSD6LQT88/IMG_7700.JPG"),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade200),
                    margin: EdgeInsets.all(5),
                    height: 100,
                    width: 100,
                    // color: Colors.amber,
                  );
                }),
          ))
        ],
      )),
    );
  }
}

Widget profileDetails(String text, String category) {
  return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            category,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ));
}

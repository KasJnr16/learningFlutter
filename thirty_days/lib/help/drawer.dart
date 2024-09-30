import 'dart:io';

import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            color: const Color.fromARGB(255, 115, 22, 132),
            child: ListView(
              children: [
                DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 45,
                              backgroundImage: FileImage(
                                  File("C:UsersmojisPicturessacks.jpg"))),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kassim Jnr",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text("abdc@gmail.com",
                                  style: TextStyle(color: Colors.white))
                            ],
                          )
                        ],
                      ),
                    )),
                const ListTile(
                  leading: Icon(Icons.folder, color: Colors.white),
                  title: Text(
                    "My Files",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.people, color: Colors.white),
                  title: Text(
                    "Shared with me",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.star, color: Colors.white),
                  title: Text(
                    "Starred",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.delete, color: Colors.white),
                  title: Text(
                    "Trash",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.upload, color: Colors.white),
                  title: Text(
                    "My Upload",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(Icons.share, color: Colors.white),
                  title: Text(
                    "Share",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.logout, color: Colors.white),
                  title: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
            title: const Text("Drawer", style: TextStyle(color: Colors.white)),
            backgroundColor: const Color.fromARGB(255, 107, 16, 123)),
        body: Container(
            child: const Center(
          child: Text("Hey there"),
        )));
  }
}

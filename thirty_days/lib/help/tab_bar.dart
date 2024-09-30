import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // initialIndex: ,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Whats App"),
          bottom: const TabBar(
              automaticIndicatorColorAdjustment: true,
              indicatorWeight: 5,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.chat,
                    color: Colors.white,
                  ),
                  child: Text(
                    "Chat",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.chat_bubble,
                    color: Colors.white,
                  ),
                  child: Text(
                    "Status",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  child: Text(
                    "Call",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ]),
        ),
        body: TabBarView(children: [
          Container(
            child: Center(
              child: Text(
                "Chats",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "Status",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "Call",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

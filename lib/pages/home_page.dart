import 'package:flutter/material.dart';

import './profile_page.dart';
import './recent_conversations_page.dart';
import './search_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double _height;
  double _width;

  TabController _tabBarController;

  _HomePageState() {
    _tabBarController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 18),
        ),
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            'assets/deer.png',
            fit: BoxFit.contain,
            height: 24,
            width: 24,
            color: Colors.white70,
          ),
          Container(
              padding: const EdgeInsets.all(6.0),
              child: Text('Sigun',
                  textAlign: TextAlign.start,
                  style: TextStyle(color: Colors.white70))),
        ]),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(),
              child: InkWell(
                child: Icon(Icons.more_vert, color: Colors.white60),
                onTap: () {},
              ))
        ],
        bottom: TabBar(
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.tealAccent,
            labelColor: Colors.tealAccent,
            labelStyle: TextStyle(fontSize: 10),
            controller: _tabBarController,
            tabs: [
              Tab(
                  icon: Icon(
                    Icons.people_outline,
                    size: 25,
                  ),
                  text: "Contacts"),
              Tab(
                  icon: Icon(
                    Icons.chat_bubble_outline,
                    size: 25,
                  ),
                  text: "Chats"),
              Tab(
                  icon: Icon(
                    Icons.person_outline,
                    size: 25,
                  ),
                  text: "Profile"),
            ]),
      ),
      body: _tabBarPages(),
    );
  }

  Widget _tabBarPages() {
    return TabBarView(
      controller: _tabBarController,
      children: <Widget>[
        SearchPage(_height, _width),
        RecentConversationsPage(_height, _width),
        ProfilePage(_height, _width),
      ],
    );
  }
}

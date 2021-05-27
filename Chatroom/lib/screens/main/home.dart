import 'package:Chatroom/screens/main/home/feed.dart';
import 'package:Chatroom/screens/main/home/search.dart';
import 'package:Chatroom/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _authService = AuthService();
  int _currentIndex = 0;
  final List<Widget> _children = [Feed(), Search()];

  void onTapPressed(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Drawer Header"),
              decoration: BoxDecoration(color: Colors.black),
            ),
            ListTile(
                title: Text("profile"),
                onTap: () {
                  Navigator.pushNamed(context, '/profile',
                      arguments: FirebaseAuth.instance.currentUser.uid);
                }),
            ListTile(
                title: Text("Log Out"),
                onTap: () async {
                  _authService.signOut();
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapPressed,
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}

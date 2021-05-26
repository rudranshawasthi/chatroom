import 'package:Chatroom/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Text("home"),
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
                  Navigator.pushNamed(context, '/profile');
                }),
            ListTile(
                title: Text("edit"),
                onTap: () {
                  Navigator.pushNamed(context, '/edit');
                }),
            ListTile(
                title: Text("Log Out"),
                onTap: () async {
                  _authService.signOut();
                }),
          ],
        ),
      ),
    );
  }
}

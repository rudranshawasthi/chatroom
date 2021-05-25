import 'package:Chatroom/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton.icon(
            label: Text("Sign Out"),
            onPressed: () async {
              _authService.signOut();
            },
            icon: Icon(Icons.person),
          )
        ],
      ),
      body: Text("home"),
    );
  }
}

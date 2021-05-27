import 'package:Chatroom/screens/main/profile/list.dart';
import 'package:Chatroom/services/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  UserService _userService = UserService();
  String search = '';

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: _userService.queryByName(search),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  search = text;
                });
              },
              decoration: InputDecoration(hintText: 'Search...'),
            ),
          ),
          ListUsers()
        ],
      ),
    );
  }
}

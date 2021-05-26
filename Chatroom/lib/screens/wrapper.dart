import 'package:Chatroom/screens/main/home.dart';
import 'package:Chatroom/screens/main/posts/add.dart';
import 'package:Chatroom/models/user.dart';
import 'package:Chatroom/screens/auth/signup.dart';
import 'package:Chatroom/screens/main/profile/edit.dart';
import 'package:Chatroom/screens/main/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);

    print(user);

    if (user == null) {
      return SignUp();
    }
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/add': (context) => AddState(),
        '/profile': (context) => Profile(),
        '/edit': (context) => Edit(),
      },
    );
  }
}

class Add {}

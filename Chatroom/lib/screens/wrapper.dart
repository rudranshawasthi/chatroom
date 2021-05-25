import 'package:Chatroom/screens/main/home.dart';
import 'package:Chatroom/models/user.dart';
import 'package:Chatroom/screens/auth/signup.dart';
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
    return Home();
  }
}

import 'package:Chatroom/screens/main/posts/listpost.dart';
import 'package:Chatroom/services/posts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PostService _postService = PostService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value:
            _postService.getPostByUser(FirebaseAuth.instance.currentUser.uid),
        child: Scaffold(
          body: Container(
            child: ListPosts(),
          ),
        ));
  }
}

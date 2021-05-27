import 'package:Chatroom/models/post.dart';
import 'package:Chatroom/screens/main/posts/listpost.dart';
import 'package:Chatroom/services/posts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  PostService _postService = PostService();

  @override
  Widget build(BuildContext context) {
    return FutureProvider.value(
      value: _postService.getFeed(),
      child: Scaffold(
        body: ListPosts(),
      ),
    );
  }
}

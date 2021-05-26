import 'package:Chatroom/services/posts.dart';
import 'package:flutter/material.dart';

class AddState extends StatefulWidget {
  @override
  _AddStateState createState() => _AddStateState();
}

class _AddStateState extends State<AddState> {
  final PostService _postService = PostService();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add tweet'),
        actions: [
          TextButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)),
              onPressed: () async {
                _postService.savePost(text);
                Navigator.pop(context);
              },
              child: Text('Tweet')),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: new Form(
          child: TextFormField(
            onChanged: (val) {
              setState(() {
                text = val;
              });
            },
          ),
        ),
      ),
    );
  }
}

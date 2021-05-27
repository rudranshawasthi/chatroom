import 'dart:developer';

import 'package:Chatroom/models/post.dart';
import 'package:Chatroom/services/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:quiver/iterables.dart';

class PostService {
  List<PostModel> _postListFromSnapshot(QuerySnapshot snapshot) {
    print(snapshot.docs.length);
    return snapshot.docs.map((doc) {
      print(doc.get('text'));
      return PostModel(
        id: doc.id,
        text: doc.data()['text'] ?? '',
        creator: doc.data()['createrID'] ?? '',
        timestamp: doc.data()['timestamp'] ?? 0,
      );
    }).toList();
  }

  Future savePost(text) async {
    await FirebaseFirestore.instance.collection("posts").add({
      "text": text,
      'createrID': FirebaseAuth.instance.currentUser.uid,
      'timestamp': FieldValue.serverTimestamp()
    });
  }

  Stream<List<PostModel>> getPostByUser(uid) {
    print(uid);
    return FirebaseFirestore.instance
        .collection("posts")
        .where('createrID', isEqualTo: uid)
        .snapshots()
        .map(_postListFromSnapshot);
  }

  Future<List<PostModel>> getFeed() async {
    List<String> usersFollowing = await UserService()
        .getUserFollowing(FirebaseAuth.instance.currentUser.uid);

    var splitUserFollowing = partition<dynamic>(usersFollowing, 10);
    // inspect(splitUserFollowing);

    List<PostModel> feedList = [];

    for (var i = 0; i < splitUserFollowing.length; i++) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('posts')
          .where('createrID', whereIn: splitUserFollowing.elementAt(i))
          .orderBy('timestamp', descending: true)
          .get();
      feedList.addAll(_postListFromSnapshot(querySnapshot));
    }
    feedList.sort((a, b) {
      var adate = a.timestamp;
      var bdate = b.timestamp;
      return bdate.compareTo(adate);
    });

    return feedList;
  }
}

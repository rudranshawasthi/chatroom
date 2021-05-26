import 'package:Chatroom/models/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PostService {
  List<PostModel> _postListFromSnapshot(QuerySnapshot snapshot) {
    print(snapshot.docs.length);
    return snapshot.docs.map((doc) {
      print(doc.get('text'));
      return PostModel(
        id: doc.id,
        text: doc.get('text') ?? '',
        creator: doc.get('createrID') ?? '',
        timestamp: doc.get('timestamp') ?? 0,
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
}

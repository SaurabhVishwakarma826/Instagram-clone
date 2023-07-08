import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String email;
  final String uid;
  final String photUrl;
  final String username;
  final String bio;
  final List following;
  final List followers;
  const User({
    required this.email,
    required this.uid,
    required this. photUrl,
    required this. username,
    required this. bio,
    required this. followers,
    required this. following
});

  Map<String, dynamic> toJson()=>{
    "username":username,
    "email":email,
    "uid":uid,
    "photUrl":photUrl,
    "bio":bio,
    "following":following,
    "followers":followers,
  };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String,dynamic>;
    return User(
      username: snapshot['username'],
      email: snapshot['email'],
      uid: snapshot['uid'],
      photUrl: snapshot['photUrl'],
      bio: snapshot['bio'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
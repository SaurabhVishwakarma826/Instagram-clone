import 'dart:js_interop';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_method.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String passowrd,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "there is some error";
    try {
      if (email.isNotEmpty ||
          passowrd.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //user Credential
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: passowrd);
        String photoUrl = await StorageMethod()
            .uploadImageToStorage('profilePic', file, false);
        print(cred.user!.uid);
        //add user to the firebase database
        await _firebaseFirestore.collection('user').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });
        res = 'Success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> loginUser(
      {required String email, required String password}) async {
    String res = "There is some error occord";
    try{
      if(email.isNotEmpty||password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "Success";
      }
      else{
          res = "Please Enter all the field";
      }
    }
    catch(err){
      res = err.toString();
    }
    return res;
  }
}
// 131

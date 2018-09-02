import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
abstract class BaseAuth {
  Future<FirebaseUser>current_user();
  Future<FirebaseUser>sign_in();
  Future<void>sign_out();
}
class Auth implements BaseAuth{
  final GoogleSignIn _google_signin=new GoogleSignIn();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  @override
  Future<FirebaseUser> current_user() async{
    FirebaseUser user=await _auth.currentUser();
    return user!=null?user:null;
  }

  @override
  Future<FirebaseUser> sign_in() async{
    GoogleSignInAccount googleSignInAccount = await _google_signin.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    FirebaseUser _user = await _auth.signInWithGoogle(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    print('signed in as ' + _user.displayName);
    return _user;
  }

  @override
  Future<void> sign_out() {
    return _auth.signOut();
  }

}
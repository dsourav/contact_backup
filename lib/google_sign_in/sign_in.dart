import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:contact_backup/google_sign_in/auth_provider.dart';
import 'package:path/path.dart';
import 'package:contact_backup/contact_list_page.dart';
import 'package:contact_backup/rootpage.dart';
import 'package:contact_backup/buttons/google_signin.dart';

class Google_auth extends StatefulWidget {
  final VoidCallback signin;
  Google_auth({this.signin});

  @override
  Google_authState createState() {
    return new Google_authState();
  }
}

class Google_authState extends State<Google_auth> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
       
        child: new Center(
            child:new MaterialButton(
              onPressed: ()async{

                var _auth = AuthProvider.of(context).auth;
    FirebaseUser _user = await _auth.sign_in();
    _user != null
        ? Navigator.of(context).pushReplacementNamed('contact/')
        : null;
              },
              child: new Text('Sign In',style: new TextStyle(color: Colors.white),),
              splashColor: Colors.pinkAccent,
              color: Colors.indigoAccent,
            
            )),
      ),
    );
  }

  
  Widget _buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }
    
}

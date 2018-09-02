import 'package:flutter/material.dart';
import 'package:contact_backup/google_sign_in/auth_provider.dart';
import 'package:contact_backup/google_sign_in/auth.dart';
import 'google_sign_in/sign_in.dart';
import 'contact_list_page.dart';
class Root_page extends StatefulWidget {
  @override
  _Root_pageState createState() => _Root_pageState();
}
enum AuthStatus {
  notDetermined,
  notSignedIn,
  signedIn,
}
class _Root_pageState extends State<Root_page> {
  AuthStatus authStatus = AuthStatus.notDetermined;

  @override
    void didChangeDependencies() {
      super.didChangeDependencies();
      var _auth=AuthProvider.of(context).auth;
      _auth.current_user().then((user){
        setState(() {
                  authStatus=user==null?AuthStatus.notSignedIn:AuthStatus.signedIn;
                });

      });

    }
void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
}

  @override
  Widget build(BuildContext context) {
      switch (authStatus) {
      case AuthStatus.notDetermined:
        return _buildWaitingScreen();
      case AuthStatus.notSignedIn:
        return new Google_auth(signin: _signedIn);
      case AuthStatus.signedIn:
        return new ContactListPage(sign_out: _signedOut);
    }
return null;
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
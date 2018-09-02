import 'dart:async';

import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:contact_backup/contact_detail/contact_detail_page.dart';
import 'package:contact_backup/add_contact/add_contact_page.dart';
import 'package:contact_backup/google_sign_in/sign_in.dart';
import 'package:contact_backup/google_sign_in/auth_provider.dart';
import 'package:contact_backup/google_sign_in/auth.dart';
import 'rootpage.dart';
import 'contact_list_page.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  
  // @override
  // Widget build(BuildContext context) {
  //   return new MaterialApp(
  //     title: 'Flutter Demo',
  //     theme: new ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     routes: <String, WidgetBuilder>{
  //       'add/': (BuildContext context) => new Add_Contact_Page(),
  //     },
  //     home: Switch(),
  //   );
  // }
 @override
  Widget build(BuildContext context) {
    return new AuthProvider(
      auth: new Auth(),
      child: new MaterialApp(
        title: 'contact backup',
        routes: <String, WidgetBuilder>{
        'add/': (BuildContext context) => new Add_Contact_Page(),
        'contact/':(BuildContext context) => new ContactListPage()
      },
        home: new Root_page(),
      ),
    );
  }
  
}




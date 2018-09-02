import 'dart:async';

import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:contact_backup/contact_detail/contact_detail_page.dart';
import 'package:contact_backup/add_contact/add_contact_page.dart';
import 'package:contact_backup/google_sign_in/sign_in.dart';

class ContactListPage extends StatefulWidget {
  ContactListPage({this.sign_out});
  final VoidCallback sign_out; 
  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> with WidgetsBindingObserver{
  Iterable<Contact> _contacts;
  
  @override
  void initState() {
    super.initState();
    _refresh_contacts();
  }
  _refresh_contacts() async {
    var Contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = Contacts;
    });
    
  }
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('contacts'),
      ),
     
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: (){
          // Navigator.of(context).pushNamed('add/').then((_){
          //   _refresh_contacts();
          // });
        },
      ),
      body: new SafeArea(
          child: _contacts != null
              ? ListView.builder(
                  itemCount: _contacts.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Contact c = _contacts.elementAt(index);
                    return new ListTile(
                      leading: (c.avatar != null && c.avatar.length > 0)
                          ? new CircleAvatar(
                              backgroundImage: new MemoryImage(c.avatar))
                          : new CircleAvatar(
                              child: new Text(c.displayName.length > 1
                                  ? c.displayName.substring(0, 2)
                                  : ""),
                            ),
                      title: new Text(c.displayName ?? ""),
                     
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    new Contact_detail_page(c)));
                      },
                    );
                   
                  },
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                )),
    );
  }
}
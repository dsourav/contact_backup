import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class Contact_detail_page extends StatelessWidget {

  final Contact _contacts;
  Contact_detail_page(this._contacts);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_contacts.displayName??""),
        actions: <Widget>[],
      ),
      body: new SafeArea(
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text('name'),
              trailing: new Text(_contacts.givenName??""),
            ),
            new ListTile(
              title: new Text('Middle Name'),
              trailing: new Text(_contacts.middleName??""),
            ),
            new ListTile(
              title: new Text('Family Name'),
              trailing: new Text(_contacts.familyName??""),
            ),
            new ListTile(
              title: new Text('Suffix'),
              trailing: new Text(_contacts.suffix??""),
            ),
            new ListTile(
              title: new Text('Prefix'),
              trailing: new Text(_contacts.prefix??""),
            ),
            new ItemsTile('phone', _contacts.phones)
          ],
        ),
      ),
    );
  }
}
class ItemsTile extends StatelessWidget {
  final Iterable<Item>_items;
  final String _title;
  ItemsTile(this._title,this._items);
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new ListTile(
          title: new Text(_title),
        ),
        new Column(
          children: _items.map((i)=>new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.0),
            child: new ListTile(
              title: new Text(i.label??""),
              trailing: new Text(i.value??""),
            ),
          )).toList(),
          
        )
      ],
    );
    // return new SafeArea(
    //       child: _items!=null?new ListView.builder(
    //     itemCount: _items.length??0,
    //     itemBuilder: (BuildContext context,int index){
    //       Item i=_items.elementAt(index);
    //       return new ListTile(
    //         title: new Text(i.label??""),
    //         trailing: new Text(i.value??""),
    //       );

    //     },
    //   ):new Text("data"),
      
    // );
  }
}

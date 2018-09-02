import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

class Add_Contact_Page extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Add_Contact_state();
  }
}
class Add_Contact_state extends State<Add_Contact_Page>{

  Contact _contact=new Contact();
  final GlobalKey<FormState>_form_key=new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('add contact'),
        actions: <Widget>[
          new FlatButton(
            onPressed: (){
              final form=_form_key.currentState;
              if(form.validate()){
              _form_key.currentState.save();
              ContactsService.addContact(_contact);
              Navigator.of(context).pop();
              }
              
            },
            child: new Icon(Icons.save,color: Colors.white,),
          )
        ],
      ),
      body: new Container(
        child: new Form(
          key: _form_key,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                decoration: const InputDecoration(labelText: 'First Name'),
                onSaved: (v)=>_contact.givenName=v,
                validator: Name_Validator.validate,
              ),
               new TextFormField(
                decoration: const InputDecoration(labelText: 'Middle Name'),
                onSaved: (v)=>_contact.middleName=v,
              ),
               new TextFormField(
                decoration: const InputDecoration(labelText: 'Last Name'),
                onSaved: (v)=>_contact.familyName=v,
              ),
               new TextFormField(
                decoration: const InputDecoration(labelText: 'Prefix'),
                onSaved: (v)=>_contact.prefix=v,
              ),
               new TextFormField(
                decoration: const InputDecoration(labelText: 'Suffix'),
                onSaved: (v)=>_contact.suffix=v,
              ),
               new TextFormField(
                decoration: const InputDecoration(labelText: 'Phone'),
                onSaved: (v)=>_contact.phones=[new Item(label: "mobile",value: v)],
                keyboardType: TextInputType.phone,
                validator: Phone_Num_Validator.validate,
              ),
            ],
          ),
        ),
      ),

    );
  }

}

class Name_Validator{
  static String validate(String value){
    return value.isEmpty?"Name can't be empty":null;
  }
}

class Phone_Num_Validator{
  static String validate(String value){
    return value.isEmpty?"phone number can't be empty":null;
  }
}
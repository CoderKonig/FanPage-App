import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanpage/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// class _RegisterPageState extends StatefulWidget {
//   const _RegisterPageState({Key? key}) : super(key: key);

//   @override
//   RegisterPage createState() => RegisterPage();
// }

class RegisterPage extends StatelessWidget {
  RegisterPage({ Key? key }) : super(key: key);
  

  // @override
  // RegisterPage createState() => RegisterPage();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  var _displayname = TextEditingController();
  var _email = TextEditingController();
  var _password = TextEditingController();
  var f_name = TextEditingController();
  var l_name = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
          title: const Text("Register"),
          backgroundColor: Colors.pink[400],
        ),
      body: Container(
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                controller: _displayname,
                decoration: const InputDecoration(
                  labelText: 'Enter Display Name'
                ),
                onChanged: (val){

                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  labelText: 'Enter Email'
                ),
                onChanged: (val){

                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  labelText: 'Enter a 6 Character Password'
                ),
                onChanged: (val){

                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: f_name,
                decoration: const InputDecoration(
                  labelText: 'Enter First Name'
                ),
                onChanged: (val){

                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: l_name,
                decoration: const InputDecoration(
                  labelText: 'Enter Last Name'
                ),
                onChanged: (val){

                }
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color: Colors.pink[100],
                child: Text('Register'),
                onPressed: () async {
                  // FirebaseFirestore.instance
                  //   .collection('Users')
                  //   .add({'displayname': _displayname.text,
                  //   'email': _email.text,
                  //   'password': _password.text,
                  //   'first_name': f_name.text,
                  //   'last_name': l_name.text
                  //   });
                  register();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                  
                },
              )
            ]
          ),
        ),
      ),
    );
  }

 Future<void> register() async {
    try {
      UserCredential userCredential =
        await _auth.createUserWithEmailAndPassword(
               email: _email.text, password: _password.text);
       _db
           .collection("Users")
           .doc(userCredential.user!.uid)
           .set({
             'displayname': _displayname.text,
             
              'email': _email.text,
              'first_name': f_name.text,
              'last_name': l_name.text,
              'registerDateTime':  DateFormat("yyyy-MM-dd hh:mm:ss").format(DateTime.now()),
            
              'UserRole': "Customer"

           });
     } catch (e) {

       print(e);
       return;
     }
     
    //  Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (BuildContext context) => const HomePage()));

 }}
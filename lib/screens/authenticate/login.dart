import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
//Variables for Email password and Displays

  var _email = TextEditingController();
  var _password = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text("Login"),
          backgroundColor: Colors.pink[400],
        ),
      body: Container(
        child: Form(
          child: Column(
            children: <Widget>[SizedBox(height: 20.0),
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
                  labelText: 'Enter Password'
                ),
                onChanged: (val){

                }
              ),
              SizedBox(height:20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Sign In'),
                onPressed: () async {
                  

                FirebaseAuth auth = FirebaseAuth.instance;

                User? user;

                }
              )
            ]
          ),
        ),
      ),
    );
  }
}
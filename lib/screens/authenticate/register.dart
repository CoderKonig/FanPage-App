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
                  labelText: 'Enter Password'
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
                  // if (_formKey.currentState!.validate()) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text('Processing Data')));

                  //   setState(() {
                  //     register();
                  //   });
                  // }
                },


                
              )
            ]
          ),
        ),
      ),
    );
  }

// Future<void> register() async {
//     try {
//       UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//               email: _email.text, password: _password.text);
//       _db
//           .collection("users")
//           .doc(userCredential.user!.uid)
//           .set({
//             "first_name": f_name.text,
//             "last_name": l_name.text,
//             "display name": _displayname,
            
//             "Role": "Customer",
//           })
//           .then((value) => (null))
//           .onError((error, stackTrace) => (null));
//       // ignore: unused_catch_clause
//     } on FirebaseAuthException catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.code.toString())));
//     } catch (e) {
//       // ignore: avoid_print
//       print(e);
//     }

//     setState(() {});
//     ScaffoldMessenger.of(context)
//         .showSnackBar(const SnackBar(content: Text("Registration Completed")));
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (BuildContext context) => const Home()));
//   }

//   void _register (BuildContext context) async{
//     try{
//       await  _auth.createUserWithEmailAndPassword(email: _email.text, password: _password.text);
    
//       ScaffoldMessenger.of(context).clearSnackBars();
//     } on FirebaseException catch(e){
//       if(e.code == 'email-already-in-use'){
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content:Text("A user with that email exists.")));
//         print('No user found for that email.');
//       } else if (e.code == 'weak password'){
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Password too insecure")));
//         print('Wrong Password');
//       }
//       return;
//     }
    
//     try{
//       await _db.collection("users").doc(_auth.currentUser!.uid).set({
//         "display_name" : _displayname.text,
//         "email" : _email.text,
//         "role" : "USER"
//       });
//     } on FirebaseException catch(e) {
//       ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(e.message ?? "Unknown Error")));

//     }

// }
}




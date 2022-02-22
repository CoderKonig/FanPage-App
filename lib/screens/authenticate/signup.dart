
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanpage/screens/authenticate/login.dart';
import 'package:fanpage/screens/authenticate/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget{
  SignUp({Key? key}) : super(key: key);
  //Firebase Auth and FIrestore Implementation
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final _formKey = GlobalKey<FormState>();
//Variables for Email password and Displays

  var _email = TextEditingController();
  var _password = TextEditingController();
  var _display = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Inesh Raj Fan Page"),
          backgroundColor: Colors.pink[400],
        ),
      body:Center(
        
      child: Form(
        key: _formKey,
        child:Column(
          children: [
            // TextFormField(controller: _display,),
            // TextFormField(controller: _email,),
            // TextFormField(controller: _password, obscureText: true, validator: (String? value){
            //   if(value != _password.text){
            //     return "Passwords must match.";
            //    }
            //    return null;
            // },),
            const SizedBox(height:50),
            ElevatedButton(style: ButtonStyle(backgroundColor:  MaterialStateProperty.all<Color>(Colors.pink.shade400)),onPressed: (){
              
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                
              
            },  child: const Text("Register")),
            const SizedBox(height:50),
            ElevatedButton(style: ButtonStyle(backgroundColor:  MaterialStateProperty.all<Color>(Colors.pink.shade400)),  onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
              //After pushing login, confused on where to go from here, 
            }, child: const Text("Login")),
            TextButton(onPressed: (){}, child: const Text("Forgot Password"))
          ],)
      )
    )); 
  }

  //Registeration Auth 

  

//Login Auth

 void _login (BuildContext context) async{
    try{
      await  _auth.signInWithEmailAndPassword(email: _email.text, password: _password.text);
    
      ScaffoldMessenger.of(context).clearSnackBars();
    } on FirebaseException catch(e){
      if(e.code == 'user-not-found' || e.code == 'wrong-password'){
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(" EMail/Pass COmbo incorrect")));
        
      }
      return;
    }
    
    try{
      await _db.collection("users").doc(_auth.currentUser!.uid).set({
        "display_name" : _display.text,
        "email" : _email.text
      });
    } on FirebaseException catch(e) {
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(e.message ?? "Unknown Error")));

    }
}


}


  






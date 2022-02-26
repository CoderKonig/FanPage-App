import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanpage/home.dart';
import 'package:fanpage/screens/authenticate/login.dart';
import 'package:fanpage/screens/authenticate/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Verif extends StatelessWidget {
   Verif({ Key? key }) : super(key: key);
  
   FirebaseAuth _auth = FirebaseAuth.instance;
   FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: admin(),
        builder: (context, snapshot) => _auth.currentUser == null
            ?  SignUp()
            : snapshot.hasData && snapshot.data == true
                ? Home()
                : Home());
      
      
    
  }
  Future<bool> admin() async {
    final currentUserUid = _auth.currentUser!.uid;
    final DocumentSnapshot db =
        await _db.collection('Users').doc(currentUserUid).get();
    return (db.data() as dynamic)['Admin'];
  }
}
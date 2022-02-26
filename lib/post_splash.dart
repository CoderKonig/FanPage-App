import 'package:fanpage/screens/authenticate/signup.dart';
import 'package:fanpage/screens/verification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class postSplash extends StatefulWidget {
  const postSplash({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _postSplash();
}

class _postSplash extends State<postSplash> {
  final Future<FirebaseApp> _initialize = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: FutureBuilder(
                future: _initialize,
                builder: (context, snapshot) {
                  if (snapshot.hasError) return const Text("Something Went Wrong");
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Verif();
                  } else {
                    return  SignUp();
                  }
                })));
  }
}

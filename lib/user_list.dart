import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:flutter/material.dart';
import 'package:fanpage/user.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  // final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection("users");
  fa.FirebaseAuth _auth = fa.FirebaseAuth.instance;
  User? myself;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<QuerySnapshot>(
        //snapshot of all documents in collection
        stream: users.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong querying users");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView(
            //List View of all users, building array of widgets 
              children: snapshot.data!.docs.map((DocumentSnapshot doc) {

            User user =
                User.fromJson(doc.id, doc.data() as Map<String, dynamic>);
                if(user.id == _auth.currentUser!.uid){
                  myself = user;
                }
            return ListTile(
              title: Text(user.displayName),
              subtitle: Text(user.role),
            );
          }).toList());
        },
      ),
    );
  }
}

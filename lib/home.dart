import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fanpage/screens/authenticate/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
   Home({ Key? key }) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Stream<QuerySnapshot> messages = FirebaseFirestore.instance.collection('Messages').snapshots();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Stream Builder is used to show all the items in A Firebase Firestore
      // Pulling the data from my Messages table and previewing it

      body: StreamBuilder<QuerySnapshot>(
         stream: messages,
         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
           if (snapshot.hasError){
             return Text("SOmething went Wrong");
           }
           if (snapshot.connectionState == ConnectionState.waiting){
             return Text('Loading');
           }

           final data = snapshot.requireData;
           return ListView.builder(itemCount: data.size, itemBuilder: (context,index) {
             return Text('${data.docs[index]['Message']}');
             },
           );

          
            

         },
      ),
      
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     _newPost(context);
        //   },
        //   tooltip: 'New Posts',
        //   child: const Icon(Icons.add))
         
   
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => LoginPage(),
          );
        },
        tooltip: 'Log Out',
        child: const Icon(Icons.logout),
      )
      // child: Text('Home'),
    );
  }

  void _newPost(BuildContext context) {}




}
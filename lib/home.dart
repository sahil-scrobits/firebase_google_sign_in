import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kuch_bhi/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  HomePage();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Hello ${FirebaseAuth.instance.currentUser.displayName}'),
 RaisedButton(
            onPressed: () async {
              await addCount();
              await GoogleSignIn().signOut();
              Get.to(LoginPage());
            },
            child: Text('sign out'),
          )
        ],
      )
          
         
      
    );
  }

  CollectionReference c = FirebaseFirestore.instance.collection('counter');

  Future<void> addCount() {
    return c
        .doc(id)
        .set({
          'count': 1,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}

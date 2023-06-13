
import 'package:demo/wrapper/screens/chat.dart';
import 'package:demo/wrapper/screens/register.dart';
import 'package:demo/wrapper/screens/second.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Authprovider with ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserCredential? result;
  TextEditingController username=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  User? user;
  Authprovider(){
    _auth.authStateChanges().listen((event) {
    user=_auth.currentUser;
    notifyListeners();
    });
  }

  Future Login(BuildContext context) async {
    try {
      result = await _auth.signInWithEmailAndPassword(email: email.text, password: password.text);
      print(result?.user?.uid.toString());
      //Navigator.push(context, MaterialPageRoute(builder:(context)=>SecondScreen() ));

    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    print(e);
    }
  }
  Future Register() async {
    try {
      result = await _auth.createUserWithEmailAndPassword(email: email.text, password: password.text);
      print("${result?.user?.uid.toString()},${result?.user?.email.toString()}");
    }catch(e){
      print(e);
    }
  }
  Future LogOut() async{
    try{
       await _auth.signOut();
       print("signed out");
    }catch(e){
      print(e);
    }
  }
}
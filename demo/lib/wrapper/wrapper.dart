import 'package:demo/provider/provider.dart';
import 'package:demo/wrapper/screens/chat.dart';
import 'package:demo/wrapper/screens/login.dart';
import 'package:demo/wrapper/screens/second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Authprovider>(
      builder: (context,Authprovider,_)
      {
        if(Authprovider.user!=null){
          return ChatApp();
        }
        return LoginScreen();
      }
      );
  }
}


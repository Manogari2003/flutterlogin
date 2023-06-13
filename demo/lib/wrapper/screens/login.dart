import 'package:demo/wrapper/screens/register.dart';
import 'package:demo/wrapper/screens/second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Authprovider>(
      builder: (context, Authprovider,_) {
        return Scaffold(
         appBar: AppBar(
           title: Text("Chat-Login",textDirection: TextDirection.ltr,
         ),
        ),
          body:Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                SizedBox(
                  height:30 ,
                ),
                TextFormField(
                  controller:Authprovider.email,
                  decoration:InputDecoration(
                    label: Text("email"),
                    hintText: "enter your email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height:30 ,
                ),
                TextFormField(
                  controller: Authprovider.password,
                  decoration:InputDecoration(
                    label: Text("password"),
                    hintText: "enter your password",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height:30 ,
                ),
               ElevatedButton(onPressed: (){
                Authprovider.Login(context);
               }, child: Text("login",textDirection: TextDirection.ltr,)),
                SizedBox(
                  height:30 ,
                ),
                ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );

                }, child: Text("register",textDirection: TextDirection.ltr,)),

              ],

            ),
          )
        );
      }
    );

  }
}

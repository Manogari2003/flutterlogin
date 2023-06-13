import 'package:demo/provider/provider.dart';
import 'package:demo/wrapper/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Authprovider>(
        builder: (context, Authprovider,_) {
          return Scaffold(
            appBar:AppBar(
              actions: [
                IconButton(onPressed:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                }, icon:Icon( Icons.login))
              ],
              title: Text("Chat-Register",textDirection: TextDirection.ltr,),
            ),
            body: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      label: Text("Username",textDirection: TextDirection.ltr,),
                      hintText: "enter  your name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller:Authprovider.email,
                    decoration: InputDecoration(
                      label: Text("Email",textDirection: TextDirection.ltr,),
                      hintText: "enter  your email",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller:Authprovider.password,
                    decoration: InputDecoration(
                      label: Text("Password",textDirection: TextDirection.ltr,),
                      hintText: "enter  your password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(onPressed: (){
                    Authprovider.Register();
                  }, child: Text("Register",textDirection: TextDirection.ltr,))
                ],
              ),
            ),
          );
        }
    );

  }
}


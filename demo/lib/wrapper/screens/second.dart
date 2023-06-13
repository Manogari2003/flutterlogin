import 'package:demo/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Authprovider>(
        builder: (context,Authprovider,_)
        {
        return Scaffold(
          appBar: AppBar(
            title: Text("second",textDirection: TextDirection.ltr,),
          ),
          body: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                ElevatedButton(onPressed: (){
                  Authprovider.LogOut();
                }, child: Text("logout",textDirection: TextDirection.ltr,))
              ],
            ),
          ),
        );

    });
  }
}

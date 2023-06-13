import 'package:demo/firebase_options.dart';
import 'package:demo/provider/provider.dart';
import 'package:demo/wrapper/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform
  );
  runApp(app());
}
class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
    ChangeNotifierProvider<Authprovider>( create: (context) =>Authprovider()),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title:"myapp",
        home: Wrapper(),
      ),
    );
  }
}

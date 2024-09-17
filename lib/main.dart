import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techwiz_5/Login.dart';
import 'package:techwiz_5/Register.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userEmail = prefs.getString('userEmail');

  runApp(MyApplication(startScreen: userEmail == null ? Login() : Register()
  ));
}

class MyApplication extends StatelessWidget {
  final Widget startScreen;


  MyApplication({required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Register(),
      debugShowCheckedModeBanner: false,
    );
  }
}
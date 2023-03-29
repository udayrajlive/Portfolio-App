import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/about.dart';
import 'package:untitled5/downloads.dart';
import 'package:untitled5/home.dart';
import 'package:untitled5/projects.dart';
import 'package:untitled5/splashScreen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => SplashScreen(),  //This is what you are missing i guess
        '/home' : (context)=> MyHomePage(),
        '/about': (context) => (MyAbout()),
        '/project': (context) =>MyProjects(),
        '/downloads': (context)=>AllDownloadFiles(),
      }

    );
  }
}


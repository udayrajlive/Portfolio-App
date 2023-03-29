import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled5/widgets/routeAnimation.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body:
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff0061ff),Color(0xff60efff)])
          ),
          child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Lottie.asset('assets/lotties/man.json'),

                ),

                SizedBox(
                  height: 200,
                  child: Lottie.asset("assets/lotties/welcome.json",fit: BoxFit.contain,
                  repeat: true),
                ),

  SizedBox(
    height: 100,
  ),

                Container(
                  width:140,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color:Colors.black,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.yellowAccent,
                        offset: Offset(
                          0.0,
                          5.0
                        ),
                        blurRadius: 1
                      ),

                    ]
                  ),
                  child: TextButton(onPressed: (){
                    Navigator.push(context, MyRoute1(MyHomePage()));
                  }, child: Text(
                    "Get Started",
                    style: GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(fontSize: 20,color: Colors.white)
                    ),
                  )),
                )

              ],
            )

        ),

      );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAbout extends StatefulWidget {
  const MyAbout({Key? key}) : super(key: key);

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: AppBar(

          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 35 ),
                child: ShaderMask(
                  blendMode: BlendMode.dstIn,
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent])
                        .createShader(
                            Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                  },
                  child: Image.asset(
                    'assets/1.png',
                    height: 500,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.59),
                child: Column(

                  children: [
                    Text(
                      'Hello I am ',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.9)),
                    ),
                    Text(
                      'Udayraj Singh',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 42,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.4)),
                    ),
                    Text(
                      'Flutter Developer',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.8)),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.yellowAccent,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                          ]),
                      child: TextButton(
                          onPressed: () {
                            openWhatsapp("Hey uday we want to hire you");
                          },
                          child: Text(
                            'Hire Me',
                            style: GoogleFonts.robotoCondensed(
                                textStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                          )),
                    ),
                    SizedBox( height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,right: 16.0),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: GestureDetector(
                                  onTap: ()=>launchUrl(Uri.parse('https://www.instagram.com/uday75ui/'),mode: LaunchMode.externalApplication),
                                  child: Lottie.asset('assets/lotties/instagram.json',
                                  ),
                                )
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Instagram',style: GoogleFonts.robotoCondensed(textStyle: TextStyle(fontSize: 12,
                              fontWeight: FontWeight.normal,color: Colors.blueGrey)),)
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: GestureDetector(
                                    onTap: (){
                                     openWhatsapp("hi.");
                                    },
                                    child: Lottie.asset('assets/lotties/whatsapp.json',
                                    ),
                                  )
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('whatsapp',style: GoogleFonts.robotoCondensed(textStyle: TextStyle(fontSize: 12,
                                  fontWeight: FontWeight.normal,color: Colors.blueGrey)),)
                            ],
                          ), Column(
                            children: [
                              SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: InkWell(
                                    onTap: ()=> launchUrl(Uri.parse('https://www.linkedin.com/in/udayraj-singh/'),
                                    mode: LaunchMode.externalApplication),
                                    child: Lottie.asset('assets/lotties/linkedin.json',
                                    ),
                                  )
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('LinkedIn',style: GoogleFonts.robotoCondensed(textStyle: TextStyle(fontSize: 12,
                                  fontWeight: FontWeight.normal,color: Colors.blueGrey)),)
                            ],
                          ), Column(
                            children: [
                              SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: InkWell(
                                      onTap: () => launchUrl(Uri.parse('https://github.com/udayrajlive'),
                                      mode: LaunchMode.inAppWebView),
                                      child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_BbKXYp.json',fit:BoxFit.cover)) ,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Github',style: GoogleFonts.robotoCondensed(textStyle: TextStyle(fontSize: 12,
                                  fontWeight: FontWeight.normal,color: Colors.blueGrey)),)
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  openWhatsapp(String message) async{
    var myWhatsAppNo ="+917398007386";
    var myWhatsappUrl_android ="whatsapp://send?phone="+myWhatsAppNo+"&text=$message";
    var myWhatsappUrl_Ios ="https://wa.me/$myWhatsAppNo?text=${Uri.parse('Hello')}";
    if(Platform.isIOS){
       //for _ios
       if (await canLaunchUrl(Uri.parse(myWhatsappUrl_Ios))){
         await launchUrl(Uri.parse(myWhatsappUrl_Ios));
       }
       else{
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("Whatsapp Not Installed ")));
       }

    }else{
      if (await canLaunchUrl(Uri.parse(myWhatsappUrl_android))){
        await launchUrl(Uri.parse(myWhatsappUrl_android));
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: new Text("Whatsapp Not Installed ")));
      }
      //android./web

    }
  }
}

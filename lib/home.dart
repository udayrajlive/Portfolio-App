import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled5/about.dart';
import 'package:untitled5/downloads.dart';
import 'package:untitled5/projects.dart';
import 'package:untitled5/widgets/routeAnimation.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  myAchievment(num, type) {
    return Row(
      children: [
        Text(num,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            )),
        SizedBox(
          width: 1,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(type,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ),
      ],
    );
  }

  mySpec(icon, type) {
    return Container(
        width: 105,
        height: 105,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.greenAccent,
              offset: Offset(0.0, 0.2),
            )
          ],
        ),
        child: Card(
          color: Color(0xff252525),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: null,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: SvgPicture.asset(
                    icon,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  type,
                  style: GoogleFonts.robotoCondensed(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: PopupMenuButton(
          constraints: const BoxConstraints.expand(width: 180,
          height:110),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.greenAccent,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          icon: Icon(
            Icons.menu_sharp,
            color: Colors.yellowAccent,
          ),
          color: Colors.black87,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 1,
              child: GestureDetector(
                onTap: () => Navigator.push(context,MyRoute1(MyProjects()) ,
                ),
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(6.0)),
                  alignment: Alignment.topCenter,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 40,
                          height: 40,
                          child: Lottie.asset('assets/lotties/codeScreen.json',
                              fit: BoxFit.contain)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Projects",
                        style: GoogleFonts.abel(
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
              ),
            ),

            PopupMenuItem(
              value: 1,
              child: GestureDetector(
                onTap: () => Navigator.push(context,MyRoute1(MyAbout())),
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(6.0)),
                  alignment: Alignment.topCenter,
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                          width: 40,
                          height: 40,
                          child: Lottie.asset('assets/lotties/link.json',
                              fit: BoxFit.contain)),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "links ",
                        style: GoogleFonts.abel(
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                                color: Colors.black)),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 50,
            //       height: 50,
            //       child: lottie.assets
            //     )
            //   ],
            //
            // ))
          ],
        ),
        actions: [
          GestureDetector(
            onTap: ()=>Navigator.push(context,MyRoute1(AllDownloadFiles())),


            child: Container(
              width: 100,
              height:170,
              child: Row(

                children: [
                  Container(
                    width:50,
                      height: 50,
                      child: Lottie.asset("assets/lotties/resume.json",fit: BoxFit.fill)),
                  Text(
                    "Assets",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      color: Colors.yellowAccent,
                    )),
                  )
                ],
              ),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SlidingSheet(
        elevation: 4,
        cornerRadius: 24,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,

          // Set custom snapping points.
          snappings: [0.4, 1.0, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 35),
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
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.49),
                child: Column(
                  children: [
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
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.8)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myAchievment('15', 'Projects'),
                      myAchievment('5', 'Clients'),
                      myAchievment('67', 'Messages'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Specialized In ",
                    style: GoogleFonts.robotoCondensed(
                        textStyle: TextStyle(
                      fontSize: 20,
                      letterSpacing: -0.7,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpec('assets/android.svg', 'Android'),
                          mySpec('assets/flutter.svg', 'Flutter'),
                          mySpec('assets/firebase.svg', 'Firebase'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpec('assets/cpp.svg', 'C++'),
                          mySpec('assets/dart.svg', 'Dart'),
                          mySpec('assets/git.svg', 'Git/GitHub'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpec('assets/dataStructure.svg', 'Data Stru.'),
                          mySpec('assets/algorithm.svg', 'Algorithm'),
                          mySpec('assets/oop.svg', 'OOP'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mySpec('assets/adobeae.svg', 'Adobe Ae.'),
                          mySpec('assets/figma.svg', 'Figma'),
                          mySpec('assets/adobepr.svg', 'Adobe Pr.'),
                        ],
                      ),
                    ],
                  )
                ],
              ));
        },
      ),
    );
  }
}

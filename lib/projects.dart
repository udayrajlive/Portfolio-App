
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);
 
@override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects>
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xf262628),
        title: Text("Projects",style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 22,

            fontWeight: FontWeight.normal,
            color: Colors.white
          )
        ),)
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,

          // margin: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                child: addProject("Flutter,NewsApi ", "Hindustan Grip", " a news App which uses NewsApi for the latest news from the world and display in the app. and access the webpages", "10"),
                onDoubleTap: ()=>openFile("https://github.com/udayrajlive/HindustanGrip"),
              ),
              GestureDetector(
                child: addProject("Flutter,Firebase,GetX", "Reels App",'a Reels scroll page where user can upload the reels, message to other users,search panel for searching other users and profile page', "19"),
                onDoubleTap: ()=>openFile("https://github.com/udayrajlive/Reels_App"),
              ),GestureDetector(
                child: addProject("HTML,CSS,PHP,SQL", "BakeryShop", "An online Bakery shop that allows users to check for various bakery products available at the online store and purchase online.", "19"),
                onDoubleTap: ()=>openFile("https://github.com/udayrajlive/Bakery-Shop"),
              ),
              
              

            ],
          ),
        ),
      ),


    );
  }
}

addProject( String language, String projName, String desc, String rating) {
 return StreamBuilder<Object>(
   stream: null,
   builder: (context, snapshot) {
     return Container(
        height: 200,
        width: MediaQuery.of(context).size.width*0.95 ,

        child:  Card(
          color: Color(0xff262628),

          child: Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 10,bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff262628),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(language,style: GoogleFonts.robotoCondensed(textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Colors.grey
                  )),),
                  Text(projName,style: GoogleFonts.roboto(textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      letterSpacing: 0.9,
                      color: Colors.white
                  )),
                  overflow: TextOverflow.ellipsis,),
                  SizedBox(
                    height: 35,
                    width: MediaQuery.of(context).size.width*0.8,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(desc,style: GoogleFonts.robotoCondensed(textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.grey
                      )),
                       ),
                    ),
                  ),


                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        height:50,
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.star,
                              color: Colors.grey,),
                            Text(rating,style: GoogleFonts.robotoCondensed(textStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15,
                            )),),
                          ],

                        ),
                      ),
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: SvgPicture.asset('assets/github.svg',fit: BoxFit.contain,color: Colors.white,
                        ),
                      )



                    ],

                  )


                ],
              ),
            ),
          ),
        ),
      );
   }
 );
  
  
}
openFile(String url) async{
  
    if (await canLaunchUrl(Uri.parse(url))){
      await launchUrl(Uri.parse(url));
    }
    
}
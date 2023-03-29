import 'dart:io';

import 'package:flutter/services.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:path_provider/path_provider.dart';

class AllDownloadFiles extends StatefulWidget {
  const AllDownloadFiles({Key? key}) : super(key: key);

  @override
  State<AllDownloadFiles> createState() => _AllDownloadFilesState();
}




class _AllDownloadFilesState extends State<AllDownloadFiles> {

Map<int, double>downloadProgress ={};
 late Future<ListResult> futureFiles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    futureFiles = FirebaseStorage.instance.ref('/files').listAll();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: Text("Assets",style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
                fontSize: 22,

                fontWeight: FontWeight.normal,
                color: Colors.white,
            )
        ),),
        backgroundColor: Colors.black,

      ),
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context,snapshot){
          if(snapshot.hasData){
            final files = snapshot.data!.items;
            return ListView.builder(
                itemCount: files.length,
                itemBuilder: (context,index){
              final file =files[index];
              double? progress = downloadProgress[index];
              return Container(
                child: ListTile(
                  title: Text(file.name,style: GoogleFonts.robotoCondensed(
                    fontSize: 15,
                    color: Colors.blue
                  ),),
                  subtitle: progress != null?
                      LinearProgressIndicator(
                        value :progress,
                        backgroundColor: Colors.white70,
                      ):null,
                  trailing: IconButton(
                    onPressed: () async{
                         return await downloadFile(index,file);

                    },
                    icon: const Icon(Icons.file_download,color: Colors.blue,),
                  ),
                ),
              );
            },
            );
          }
          else if(snapshot.hasError){
            return Scaffold(
              body:    Container(
                decoration:  BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: const [
                   BoxShadow(
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                      blurRadius: 5 ,
                      spreadRadius: 4.0,
                    )
                  ]
                ),
                width: MediaQuery.of(context).size.width*0.7,
                height: MediaQuery.of(context).size.width*0.4,
                child: Column(
                  children: [
                    Text(
                     " Error Occured",
                      style: GoogleFonts.poppins(
                        fontSize: 40,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.cancel_rounded, color: Colors.yellow,))
                  ],
                ),
              ),
            );
          }
          else {
             return const Center(
               child: CircularProgressIndicator(),
             );

          }
        }

      )
    );


  }
 Future downloadFile(int index,Reference ref) async{

    //not visible .

   //  final dir  = await getApplicationDocumentsDirectory();
   //  final file = File('${dir.path}/${ref.name}');
   // await ref.writeToFile(file);
   /// visible to galary
 final   url  = await ref.getDownloadURL();

   final tempDir  = await getTemporaryDirectory();
   final path = '${tempDir.path}/${ref.name}';
   print("$path");
   await Dio().download(
       url,
       path,
     onReceiveProgress: (recieve,total){
         double progress = recieve/total;
         setState(() {
           downloadProgress[index] = progress;

         });
     }

   );
  if(url.contains('.mp4')){
    await GallerySaver.saveVideo(path, toDcim: true);
    await OpenFilex.open(path);
  }else if(url.contains('.jpg')){
    await GallerySaver.saveVideo(path,toDcim: true);
    await OpenFilex.open(path);
  }
  else if(url.contains('.pdf')){
     await OpenFilex.open(path);

  }
   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Downloaded ${ref.name}')));
 }
}

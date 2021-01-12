import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'image-view-screen.dart';

class QuranImgesScreen extends StatefulWidget {
  @override
  _QuranImgesScreenState createState() => _QuranImgesScreenState();
}

class _QuranImgesScreenState extends State<QuranImgesScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_init();

  }


//  _init()async{
//    String path = 'assets/chapters.json';
//    String jobsString = await rootBundle.loadString(path);
//    List<dynamic> users = await jsonDecode(jobsString);
//
//    print("\n\n: ${users.toString()}");
//  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //appBar: AppBar(title: General.buildTxt(txt: "الـصـور"),backgroundColor: Colors.amberAccent,),
        body: FutureBuilder(
          builder: (context,snapshot){
            var Data = jsonDecode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext cotext,int index){
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ImageView(
                      startpage: Data[index]['pages'][0],
                      finalpage: Data[index]['pages'][1],
                      chapterName: Data[index]['chapter_number'],
                      imageName: Data[index]['name_arabic'],
                    )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top:5.0,left:15,right: 15),
                    child: Container(
                      height: 55,
                      child: Card(
                        elevation: 3,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left:20,right: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(Data[index]['id'].toString(),style: TextStyle(color: Colors.black),),
                                    SizedBox(width: 20,),
                                    Text(Data[index]['name_arabic'],style: TextStyle(color: Colors.black),),

                                  ],
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(right:20,left: 10),
                                child: Row(
                                  children: <Widget>[
                                    Text(Data[index]['name_simple'],style: TextStyle(color: Colors.black),),
                                    SizedBox(width: 20,),
                                    Text(Data[index]['id'].toString(),style: TextStyle(color: Colors.black),),

                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),


//                        ListTile(
//                          title: Text(Data[index]['name_arabic'],style: TextStyle(color: Colors.black),),
//                          trailing: Text(Data[index]['name_simple'],style: TextStyle(color: Colors.black),),
//                          leading: Text(Data[index]['id'].toString(),style: TextStyle(color: Colors.black),),
//                        ),



                      ),
                    ),
                  ),
                );
              },
                itemCount:Data == null ? 0 : Data.length
            );
          },
          future: DefaultAssetBundle.of(context).loadString("assets/chapters.json"),
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';

import 'image-view-screen.dart';


class QuranPartsScreen extends StatefulWidget {
  @override
  _QuranImgesScreenState createState() => _QuranImgesScreenState();
}

class _QuranImgesScreenState extends State<QuranPartsScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                      imageName: Data[index]['chapter_number'],
                      chapterName: Data[index]['name_arabic'],
                      pageName: "parts",
                    )));
                  },
                  child: ListTile(
                    title: Text(Data[index]['name_arabic'],style: TextStyle(color: Colors.black),),
                    trailing: Text(Data[index]['name_simple'],style: TextStyle(color: Colors.black),),
                    leading: Text(Data[index]['id'].toString(),style: TextStyle(color: Colors.black),),
                  ),
                );
              },
                itemCount:Data == null ? 0 : Data.length
            );
          },
          future: DefaultAssetBundle.of(context).loadString("assets/parts.json"),
        ),
      ),
    );
  }
}

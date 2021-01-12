import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quranapp/lib/constant/general.dart';
import 'package:share/share.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

class ImageView extends StatefulWidget {
  final int startpage;
  final int finalpage;
  final String chapterName;
  final String imageName;
  final String pageName;

  ImageView(
      {this.startpage,
      this.finalpage,
      this.chapterName,
      this.imageName,
      this.pageName});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  int swrt_value = 1;
  static GlobalKey _globalKey = GlobalKey();

  int pageNumber;

  @override
  void initState() {
    super.initState();
    pageNumber = widget.startpage;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                height: 55,
                width: double.infinity,
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          widget.chapterName == null
                              ? Container()
                              : General.buildTxt(
                                  txt: "الجزء :  ",
                                  fontSize: 15,
                                  color: Colors.white),
                          widget.chapterName == null
                              ? Container()
                              : General.buildTxt(
                                  txt: widget.chapterName,
                                  fontSize: 15,
                                  color: Colors.white),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          widget.imageName == null
                              ? Container()
                              : General.buildTxt(
                                  txt: "االسورة :  ",
                                  fontSize: 15,
                                  color: Colors.white),
                          widget.imageName == null
                              ? Container()
                              : General.buildTxt(
                                  txt: widget.imageName,
                                  fontSize: 15,
                                  color: Colors.white),
                        ],
                      ),
                    ),

//                    widget.pageName=="parts"?
                    Container(
                      child: Row(
                        children: <Widget>[
                          widget.startpage == pageNumber
                              ? Container()
                              : GestureDetector(
                                  onTap: () {
                                    _perviousPage();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 30,
                                  )),
                          widget.finalpage == pageNumber
                              ? Container()
                              : GestureDetector(
                                  onTap: () {
                                    _nextPage();
                                  },
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 30,
                                  )),
                        ],
                      ),
                    ),
                    //:Container(),
                    Container(
                      child: Row(
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                shareScreenshot();
                              },
                              child: Icon(Icons.share,
                                  size: 25, color: Colors.white)),
                          SizedBox(
                            width: 5,
                          ),
                          General.buildTxt(
                              txt: "مشاركة", fontSize: 15, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Stack(children: <Widget>[
                RepaintBoundary(
                  key: _globalKey,
                  child: Container(
                      height: screenHeight * .93,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Image.asset(
                        "assets/images/${pageNumber}.jpg",
                        fit: BoxFit.fill,
                      )),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  _nextPage() {
    pageNumber += 1;
    setState(() {});
  }

  _perviousPage() {
    pageNumber -= 1;
    setState(() {});
  }

  Future<void> shareScreenshot() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject();

//     if (!boundary.debugNeedsPaint) {
//        Timer(Duration(seconds: 1), () => shareScreenshot());
//        return null;
//      }

    ui.Image image = await boundary.toImage();
    final directory = (await getExternalStorageDirectory()).path;
    ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData.buffer.asUint8List();
    File imgFile = new File('$directory/screenshot.png');
    imgFile.writeAsBytes(pngBytes);
    final RenderBox box = context.findRenderObject();
    Share.shareFile(File('$directory/screenshot.png'),
        subject: 'Share ScreenShot',
        text: 'ورد اليوم',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
//    } on PlatformException catch (e) {
//      print("Exception while taking screenshot:" + e.toString());
//    }
//    setState(() {
//    });
  }
}

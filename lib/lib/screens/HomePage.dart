import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:quranapp/lib/constant/general.dart';
import 'Quran-Imges-Screen.dart';
import 'quran-parts-creen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(General.getColorHexFromStr("#194262")));

    double width = MediaQuery.of(context).size.width;

    double yourWidth = width  / 4;

    return Scaffold(
      body: DefaultTabController(
        //initialIndex: widget.initialIndex,
        length: 3,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 60),
              child: Padding(
                padding: EdgeInsets.only(left:10.0,top:30.0),
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Theme.of(context).primaryColor,
                  //unselectedLabelColor: Colors.red,
                  tabs: [


                    Tab(
                      child:Container(
                        width: yourWidth,
                          child: General.buildTxt(txt: "الـسـور",color: Colors.white,isBold: true)
                      )
                    ),
                    Tab(
                        child:Container(
                            width: yourWidth,
                            child: General.buildTxt(txt: "الاجزاء",color: Colors.white,isBold: true)
                        )
                    ),
                    Tab(
                        child:Container(
                            width: yourWidth,
                            child: General.buildTxt(txt: "الـصفحات",color: Colors.white,isBold: true)
                        )
                    ),
                  ],
                ),
              ),
            ),
            body: TabBarView(
              children: [
                QuranImgesScreen(),
                QuranPartsScreen(),
                QuranImgesScreen(),
                //PaymentHistory()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

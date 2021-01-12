import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'screens/HomePage.dart';
import 'constant/general.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Montserrat',
          //primaryColor: Color(General.getColorHexFromStr('#14a77e')),
          primaryColor: Color(General.getColorHexFromStr("#4580A3")),
          accentColor: Color(General.getColorHexFromStr('#2ed889')),
          //canvasColor: Colors.red,
          scaffoldBackgroundColor: Colors.white,
          //primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
              brightness: Brightness.light,
              iconTheme: IconThemeData(
                color: Colors.black,
              )),
          brightness: Brightness.light),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

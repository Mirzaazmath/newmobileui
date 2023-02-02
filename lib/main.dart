import 'dart:async';

import 'package:asws_mobile/providers/eventproviders/getalleventprovider.dart';
import 'package:asws_mobile/providers/studentprovider/getstudentprovider.dart';
import 'package:asws_mobile/screens/signup/onboardscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main(){
 runApp( MultiProvider(
   providers: [
     ChangeNotifierProvider(create: (context) => GetStudentProvider()),
     ChangeNotifierProvider(create: (context) => GetEventsProvider()),
   ],
   child: const MyApp(),


 )
 );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:Colors.blueAccent,
        cardColor: Colors.purple.shade50

      ),


      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),(){
     gotoScreen();
    });
  }
  void gotoScreen(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const OnboardScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Image.asset("assets/images/splash.png"),
      ),

    );
  }
}





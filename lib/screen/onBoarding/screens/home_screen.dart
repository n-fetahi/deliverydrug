import 'dart:async';

import 'package:deliverydrug/screen/ChooseLoignPage.dart';
import 'package:flutter/material.dart';
import 'package:deliverydrug/constant/Navigators.dart';


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
    Timer(
        Duration(seconds: 5),
            (){pushNavigator(ChooseLoignPage(),context);}
    );


  }
  @override
  Widget build(BuildContext context) {
   /// SizeOfConfig().init(context);
    return Scaffold(
      body:  Center(
          child: Container(
            decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(150),
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: Offset(0,3),
                  blurRadius: 7,
                )]

            ),
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              child: Image.asset('assets/logo2.jpg',
                height: 100,
                width: 100,
              ),
            ),
          )

      ),


    );
  }
}

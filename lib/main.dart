import 'package:deliverydrug/screen/Cart.dart';
import 'package:deliverydrug/screen/CartPages/paymentPage.dart';
import 'package:deliverydrug/screen/HomePage.dart';
import 'package:deliverydrug/screen/PersonalFilePage.dart';
import 'package:deliverydrug/screen/SignUpPage.dart';
import 'package:deliverydrug/screen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:camera/camera.dart';
int orderID=4000;
List<CameraDescription> cameras = [];
void main() async{
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],

        supportedLocales: [
          Locale('ar','AE'),
        ],

        debugShowCheckedModeBanner: false,
        home: SignUpPage());
  }
}
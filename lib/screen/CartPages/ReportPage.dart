import 'dart:async';

import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:deliverydrug/screen/HomePage.dart';
import 'package:flutter/material.dart';

import '../../constant/Navigators.dart';


class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
            (){pushNavigator(HomePage(),context);}
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Icon(Icons.check_circle,color: primaryColor,size: 90,),
          SizedBox(height: getheightScreen(20),),
           Text('تم الدفع بنجاح\n سيتم توصيل الطلب إليك في الوقت المحدد شكراً لإستخدامك تطبيق دوائك لدارك',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
            ),
            ),

        ],
      ),
    );
  }
}

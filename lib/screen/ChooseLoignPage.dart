import 'package:deliverydrug/constant/Navigators.dart';
import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:deliverydrug/myAppBar.dart';
import 'package:deliverydrug/screen/SignInPage.dart';
import 'package:deliverydrug/screen/SignUpPage.dart';
import 'package:flutter/material.dart';

import '../constant/DefultBotton.dart';


class ChooseLoignPage extends StatefulWidget {
  const ChooseLoignPage({Key? key}) : super(key: key);

  @override
  State<ChooseLoignPage> createState() => _ChooseLoignPageState();
}

class _ChooseLoignPageState extends State<ChooseLoignPage> {
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.,
      // floatingActionButton: CircleAvatar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
          alignment: Alignment.center,
            children: [

              Container(
                height: SizeOfConfig.heightScreen/2.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                  color: primaryColor
                ),
              ),
              Container(
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
                  child: Image.asset('assets/logo.png',
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
          Text('تطبيق دواؤك لدارك',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
            color: Color(0xFF9D9FA2)
          ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50,left: 50,right: 50),
              child: Column(
                children: [
                  DefultButton("تسجيل الدخول",false, (){

                    pushNavigator(SignInPage(), context);
                  },context),
                  SizedBox(height: getheightScreen(10),),
                  DefultButton("إنشاء حساب",true, (){
                    pushNavigator(SignUpPage(), context);
                  },context),
                ],
              )

          ),



        ],
      ),
    );
  }
}

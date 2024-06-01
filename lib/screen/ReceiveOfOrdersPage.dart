import 'package:deliverydrug/constant/Navigators.dart';
import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/addButton.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:deliverydrug/screen/Camera/camera_screen.dart';
import 'package:flutter/material.dart';

import '../constant/DefultBotton.dart';
import '../constant/MyBottomBar.dart';
import '../constant/MyFloatingActionButton.dart';


class ReceiveOfOrdersPage extends StatefulWidget {
  const ReceiveOfOrdersPage({Key? key}) : super(key: key);

  @override
  State<ReceiveOfOrdersPage> createState() => _ReceiveOfOrdersPageState();
}

class _ReceiveOfOrdersPageState extends State<ReceiveOfOrdersPage> {
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: MyBottomBar(
        index: 2,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: MyFloatingActionButton(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
              padding:EdgeInsets.symmetric(horizontal: getWidthScreen(30),),
                  child: SingleChildScrollView(
                    child: Column(
              children: [
                Text(
                    'أكتب طلبك',
                    style: titlesTexts,
                ),
                SizedBox(height: getheightScreen(30),),
                Text(
                    'أكتب هنا إسم الدواء أو المنتج الذي تريد طلبه من الصيدلية',
                    textAlign: TextAlign.center,
                    style: secondTextStyle,
                ),
                SizedBox(height: getheightScreen(20),),

                TextField(
                    maxLines: 7,
                    style: const TextStyle(
                        height: 1.4,
                        fontSize: 16,
                        fontFamily: 'Cairo',

                        color: Color(0xB6061C1C)
                    ),
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      fillColor: Colors.black38,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:  BorderSide(
                              width: 2,
                              color: primaryColor
                          )
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:  BorderSide.none

                      ),

                    ),
                ),
                SizedBox(height: getheightScreen(30),),

                DefultButton("التالي",false, (){},context),


              ],
          ),
                  ),
          ),
        ),
      ),
    );
  }
}

import 'package:deliverydrug/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../constant/SizeConfig.dart';
import '../../constant/MyAppBar.dart';
import '../../constant/MyBottomBar.dart';
import '../../constant/MyFloatingActionButton.dart';
import '../../constant/SizeConfig.dart';

class ActiveAlarmPage extends StatelessWidget {
  const ActiveAlarmPage({Key? key}) : super(key: key);

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getheightScreen(80)),
        child: MyAppBar(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 40,right: 10),
        height: SizeOfConfig.heightScreen,
        width: SizeOfConfig.widthScreen,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text('Meolxicam',
              style: TextStyle(
                fontSize: 20,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold
              ),),


               Container(
                 margin:EdgeInsets.only(right: 20),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('الاحد',
                       style: TextStyle(
                           fontFamily: 'Cairo',
                       ),),
                     Text('الساعة 2:00 مساء',
                       style: TextStyle(
                           fontFamily: 'Cairo',
                       ),)
                   ],
                 ),
               ),
                SizedBox(height: getheightScreen(120),),
                Center(

                  child: Column(
                    children: [
                      Text('إنتظار .',
                        style: TextStyle(
                          fontSize: 20,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Cairo'
                        ),),
                      SizedBox(height: getheightScreen(30),),
                      Icon(
                        Icons.alarm,size: 150,
                        color: primaryColor,
                      )
                    ],
                  ),

                )


          ],
        ),
      ),
    );
  }
}

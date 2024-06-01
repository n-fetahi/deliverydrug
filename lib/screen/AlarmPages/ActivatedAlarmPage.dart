import 'package:deliverydrug/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../constant/MyAppBar.dart';
import '../../constant/MyBottomBar.dart';
import '../../constant/MyFloatingActionButton.dart';
import '../../constant/SizeConfig.dart';

class ActivatedAlarmPage extends StatelessWidget {
  const ActivatedAlarmPage({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle,size: 100,color: primaryColor,),
            SizedBox(height: getheightScreen(10),),
            Text('تم تفعيل المنبه',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo'
            ),)
          ],
        ),
      ),
    );
  }
}

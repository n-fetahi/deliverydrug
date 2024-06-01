import 'package:deliverydrug/constant/Navigators.dart';
import 'package:deliverydrug/screen/HomePage.dart';
import 'package:flutter/material.dart';

import 'MyBottomBar.dart';
import 'constant.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          height: 65,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: primaryColor,
              hoverElevation: 10,
              isExtended: false,

              splashColor: Colors.grey,

              tooltip: 'الصفحة الرئيسية',
              elevation: 8,


              child: Icon(Icons.home,size: 30,),
              onPressed: () => setState(() {
                pushNavigator(HomePage(), context);
              }),
            ),
          ),
        ),
      );
  }
}

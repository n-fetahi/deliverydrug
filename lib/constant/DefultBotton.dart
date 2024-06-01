import 'package:flutter/material.dart';

import 'SizeConfig.dart';
import 'constant.dart';

Widget DefultButton(String text,bool secondColor ,Function() press,BuildContext context){
  SizeOfConfig().init(context);
  return SizedBox(
    width: double.infinity,
    height: getheightScreen(56),
    child: TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27),
          side: BorderSide(
            color: primaryColor,
            width: 2,
          )
        ),
          backgroundColor:secondColor==true? Colors.white:primaryColor
      ),
      onPressed: press as void Function(),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
            fontFamily: 'Cairo',
            color: secondColor==true? primaryColor:Colors.white
        ),
      ),
    ),
  );
}
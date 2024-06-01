import 'package:flutter/material.dart';

import 'SizeConfig.dart';
import 'constant.dart';

Widget addButton(String text,IconData icon,double size,double height
,double width,double fontSize,Function () press,BuildContext context) {
  SizeOfConfig().init(context);
  return  MaterialButton(

    onPressed: press as void Function(),
    padding: EdgeInsets.symmetric(horizontal: 20),
    color: primaryColor,
    height: getheightScreen(height),
    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),

    ),
    child: Container(
      height: getheightScreen(height),
      width: getWidthScreen(width),
      child: Row(
        children: [
          Icon(icon,size: size,color: Colors.white,),
          SizedBox(width: getWidthScreen(20),),
          Expanded(
            child: Text(text,
             textAlign: TextAlign.right,
              textWidthBasis: TextWidthBasis.longestLine,
              style: TextStyle(

                  fontSize: fontSize,
                  fontFamily: 'Cairo',
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

        ],
      ),
    ),
  );
}

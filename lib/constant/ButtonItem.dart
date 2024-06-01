import 'package:deliverydrug/constant/SizeConfig.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget ButtonItem(
String imagePath, String buttonName,
double size,Function() onTap,
Color color,
double height,
double width,

BuildContext context
){
  SizeOfConfig().init(context);
  return InkWell(
    onTap: onTap,
    child: Container(
      width: getWidthScreen(width),
      height: getheightScreen(height),
      child: Card(
        //3D
        elevation: 8,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(27),
          side: const BorderSide(
            width: 1,
            color: Colors.grey
          )
        ),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text(
           buttonName,
           style: const TextStyle(
             color: Colors.white,
             fontSize: 17,
             fontFamily: 'Cairo',

           ),
         ),
           SizedBox(
             width: 15,
           ),
           SvgPicture.asset(
             imagePath,
             height: size,
             width: size,
           ),

         ],
       ),
      ),
    ),
  );
}
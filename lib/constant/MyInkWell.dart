import 'package:flutter/material.dart';

Widget myInlWell(String text,Function() press){
  return InkWell(
    child: Text(text
    ,style: TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.blue,
        fontSize: 15,
        fontFamily: 'Cairo',

      ),
    ),
    onTap: press,
  );
}
import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:flutter/material.dart';

import 'constant.dart';


class SearchText extends StatelessWidget {
  const SearchText({Key? key,required this.press, required this.controller}) : super(key: key);
  final Function press;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Container(
      height: getheightScreen(50),
      margin:EdgeInsets.only(top: 20) ,
      child: TextFormField(
        controller: controller,
        onChanged: press as void  Function(String),
        cursorColor: primaryColor,
        style: const TextStyle(
            fontSize: 16,
            fontFamily: 'Cairo',

            color: Color(0xB6061C1C)
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(right:10 ),
          filled: true,
          fillColor: Colors.white,
          hintText: "ما الذي تبحث عنه؟",
          labelStyle: const TextStyle(
            fontSize: 15,
            color: Color(0xB6061C1C),
            fontFamily: 'Cairo',
          ),

          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:  BorderSide(
                  width: 3,
                  color: primaryColor
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide:  BorderSide(
                  width: 2,
                  color: primaryColor

              )

          ),

        ),
      ),
    );;
  }
}


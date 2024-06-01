import 'package:deliverydrug/constant/constant.dart';
import 'package:flutter/material.dart';

import 'SizeConfig.dart';

class TextFieldInfoPayment extends StatelessWidget {
  const TextFieldInfoPayment({Key? key, this.flage, required this.title, this.controller}) : super(key: key);

   final  bool ?flage;
   final  String title;
  final TextEditingController ?controller;

  @override
  Widget build(BuildContext context) {



    return Container(
          margin: flage==true?EdgeInsets.only(left: SizeOfConfig.widthScreen/2.5,right: 20)
              :EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                style: secondTextStyle,
              ),
              TextFormField(
                controller: controller,
                cursorColor: primaryColor,
                style: const TextStyle(
                    height: 1.4,
                    fontSize: 16,
                    fontFamily: 'Cairo',

                    color: Color(0xB6061C1C)
                ),
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  focusedBorder: UnderlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(
                        color: Colors.black38,
                        width: 2
                    ),
                  ),
                ),

              ),
            ],
          ),
        );
  }
}

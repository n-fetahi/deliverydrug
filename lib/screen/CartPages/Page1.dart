import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import '../../constant/paymentButton.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
   String group='payment';

   @override
  Widget build(BuildContext context) {

    SizeOfConfig().init(context);
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         SizedBox(height: getheightScreen(30),),

         paymantRadioButton('التوصيل الأساسي','سيتم توصيل الطلب خلال 3-5 أيام من تاريخ الطلب','noor'),
         SizedBox(height: getheightScreen(50),),
         paymantRadioButton('توصيل في اليوم التالي','اكتب طلبك قبل الساعة السادسة مساءً وسيتم توصيل الطلب إليك في اليوم التالي','ali'),
         SizedBox(height: getheightScreen(50),),
         paymantRadioButton('التوصيل في يوم محدد','اختر يوم من التاريخ وسيتم إيصال الطلب في اليوم المحدد','saleh'),
       ],
        );
  }

  Widget paymantRadioButton(String title,String subTitle,String value) {

    return RadioListTile(
         controlAffinity: ListTileControlAffinity.trailing,
         activeColor: primaryColor,
         title: Text(title,
         style: TextStyle(
           fontWeight: FontWeight.bold,
           fontFamily: 'Cairo'
         ),
         ),
         subtitle: Text(subTitle,
         style: TextStyle(
           fontSize: 12,
             fontFamily: 'Cairo'
         ),
         ),
         value: value,
         groupValue: group,
         onChanged: (value){
           setState(() {

             group=value.toString();

           });
         },
       );
  }
}

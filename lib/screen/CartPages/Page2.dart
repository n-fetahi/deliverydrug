import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:flutter/material.dart';

import '../../constant/Lists.dart';
import '../../constant/TextFieldInfoPayment.dart';
import '../../constant/constant.dart';
import '../../constant/CheckMark.dart';
import '../../constant/paymentButton.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  bool flage=false;
   String group='noor';
  final TextEditingController streetController=TextEditingController();
  final TextEditingController areaController=TextEditingController();
  final TextEditingController townController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    setState((){
      orderDetailsList.addAll(
          {
            'street': streetController.text,
            'area':areaController.text,
            'town':townController.text
          });
    });
    return  Container(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: getheightScreen(30),),
           CheckMark(text:'عنوان الفواتير هو نفسه عنوان التسليم'),



           SizedBox(height: getheightScreen(30),),
           TextFieldInfoPayment(title: 'شارع',controller: streetController,),
           SizedBox(height: getheightScreen(30),),
           TextFieldInfoPayment(title: 'حارة',controller: areaController,),
           SizedBox(height: getheightScreen(30)),
           TextFieldInfoPayment(title: 'مدينة',controller: townController,),
         ],
          ),
    );

  }




}

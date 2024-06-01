import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:flutter/material.dart';

import '../../constant/Lists.dart';
import '../../constant/TextFieldInfoPayment.dart';
import '../../constant/constant.dart';
import '../../constant/CheckMark.dart';
import '../../constant/paymentButton.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  bool flage=false;
   String group='noor';
  final TextEditingController nameController=TextEditingController();
  final TextEditingController accountNumberController=TextEditingController();
  final TextEditingController endDateController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    orderDetailsList.addAll(
        {
          'name': nameController.text,
          'accountNumber':accountNumberController.text,
          'endDate':endDateController.text
        });
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: getheightScreen(30),),
           SizedBox(height: getheightScreen(20),),
           TextFieldInfoPayment(title: 'الإسم',controller: nameController,),

           SizedBox(height: getheightScreen(20),),
           TextFieldInfoPayment(title: 'رقم الحساب البنكي',controller: accountNumberController),

           SizedBox(height: getheightScreen(20),),
           TextFieldInfoPayment(title: 'تاريخ إنتهاء البطاقة البنكية',flage: true,controller:endDateController,),

           SizedBox(height: getheightScreen(30),),
           CheckMark(text:'احفظ معلومات هذه البطاقة'),

         ],
          );
  }




}

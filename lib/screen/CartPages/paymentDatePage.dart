import 'dart:ui';

import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:deliverydrug/constant/myTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/Lists.dart';
import '../../constant/paymentAppBar.dart';

class paymentDatePage extends StatefulWidget {
  const paymentDatePage({Key? key}) : super(key: key);

  @override
  State<paymentDatePage> createState() => _paymentDatePageState();
}

class _paymentDatePageState extends State<paymentDatePage> {
  DateTime selectedDate = DateTime.now();
  bool flage=false;
  Future<void> _selectDate(BuildContext context) async {
    flage=true;
    final DateTime? picked = await showDatePicker(
        context: context,
        confirmText: 'إختر',
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: primaryColor,
                onPrimary: Colors.white, // <-- SEE HERE
                onSurface: Colors.black, // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: primaryColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    orderDetailsList.addAll(
        {
          'date':"${selectedDate.toLocal()}".split(' ')[0]
        });

    return  Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 150),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            SizedBox( height: getheightScreen(20)),

            Center(
              child: TextButton(
                onPressed: () => _selectDate(context),
                child:  Container(
                  width: getWidthScreen(150),
                  child: TextField(
                    textAlign: TextAlign.center,

                    enabled: false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: flage==false?'اختر تاريخ':"${selectedDate.toLocal()}".split(' ')[0],
                      hintStyle: const TextStyle(
                        fontSize: 18,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(Icons.date_range),

                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}

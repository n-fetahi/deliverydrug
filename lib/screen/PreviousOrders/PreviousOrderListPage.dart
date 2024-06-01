import 'package:deliverydrug/constant/Lists.dart';
import 'package:deliverydrug/constant/Navigators.dart';
import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:flutter/material.dart';

import 'PreviousOrderInfoPage.dart';

class PreviousOrderListPage extends StatefulWidget {
  const PreviousOrderListPage({Key? key}) : super(key: key);

  @override
  State<PreviousOrderListPage> createState() => _PreviousOrderListPageState();
}

class _PreviousOrderListPageState extends State<PreviousOrderListPage> {
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(left: 10,right: 20,top: 20),
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('الطلبات السابقة',
                style: titleStyle(17,primaryColor),
                ),
                Container(
                  height: SizeOfConfig.heightScreen-100,
                  child: ListView.builder(
                    itemCount: previousOrderList.length,
                    itemBuilder: (context,index)=> InkWell(
                      onTap: (){
                        // print(previousOrderList[index]['order'],);
                        pushNavigator(PreviousOrderInfoPage(
                          orderDetails: previousOrderList[index]['orderDetails'],
                          order: previousOrderList[index]['order'],
                        ), context);

                      },
                      child: Card(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('#${previousOrderList[index]['orderID']}',
                                style: titleStyle(17,primaryColor),
                              ),
                              // SizedBox(height: getheightScreen(2),),
                              detailsText('تاريخ الطلب : ','${previousOrderList[index]['orderDetails']['date']}'),
                              detailsText('الإجمالي : ','${previousOrderList[index]['orderDetails']['total']} ريال'),
                            ],
                          ),
                        ),
                      ),
                    )
                    ,

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget detailsText(String title,String subTitle) {
    return Row(
      children: [
        Text(title,style: titleStyle(12, primaryColor),),
        Text(subTitle,style: titleStyle(12, Colors.black45),),

      ],
    );
  }

  TextStyle titleStyle(double fontSize,Color color) {
    return TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cairo',
                        color: color
                    );
  }
}



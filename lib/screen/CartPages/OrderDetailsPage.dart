import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../constant/CheckMark.dart';
import '../../constant/Lists.dart';
import '../../constant/Navigators.dart';
import '../Cart.dart';


class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {


  @override
  Widget build(BuildContext context) {
    String accountNumberHidden='';
    String accountNumberVisible='';

    for(int i=0;i<orderDetailsList['accountNumber'].length;i++){
      if(i<orderDetailsList['accountNumber'].length-3){
        if(orderDetailsList['accountNumber'][i]==' ')
        accountNumberHidden+=" ";
        else
        accountNumberHidden+="*";
      }
      else{
        accountNumberVisible+=orderDetailsList['accountNumber'][i];
      }
    }
    orderDetailsList['accountNumber']='$accountNumberHidden$accountNumberVisible';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: getheightScreen(200),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: purchaseList.length,
              itemBuilder: (context,index)=>Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
            children: [
                Image.asset(purchaseList[index]['img'],
                  height: getheightScreen(120),
                  width: getWidthScreen(88),
                  fit: BoxFit.cover,
                ),

              Text(purchaseList[index]['name'],
              style: orderTextsStyle(Colors.black,15,false),
              ),

              Directionality(
                textDirection: TextDirection.ltr,
                child: Text('${purchaseList[index]['price']} RY',
                style: orderTextsStyle(primaryColor,15,false),
                ),
              )

            ],
          ),
              )

          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: Colors.black38,height: 0),
              SizedBox(height: getheightScreen(10),),

              buildOrderDetails("عنوان التواصل",
                  '${orderDetailsList['street']}، ${orderDetailsList['area']}، ${orderDetailsList['town']}',false,(){},context),
              Divider(color: Colors.black38,height: 20,),
              buildOrderDetails("الدفع",
                  '${orderDetailsList['accountNumber']}',true,(){},context),
            ],
          ),
        )
      ],
    );
  }

  Widget buildOrderDetails(String title,String subTitle,bool flage,Function ()onTap,BuildContext context ){
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                  style: orderTextsStyle(Colors.black,17,true),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   flage==false? Text(subTitle,
                      style: orderTextsStyle(Colors.black,13,false),
                    ):Directionality(
                       textDirection: TextDirection.ltr,
                       child: Text(subTitle)),
                    CheckMark(flage: true,disabled: true,),

                  ],
                ),
                SizedBox(height: getheightScreen(20),),

                InkWell(
                  onTap: onTap as void Function(),
                  child: Text('تغيير',
                    style: orderTextsStyle(primaryColor,14,true),
                  ),
                )
              ],
            );
  }

  TextStyle orderTextsStyle(Color color,double size,bool weight) {
    return TextStyle(
        fontFamily: 'Cairo',
        fontSize: size,
        color: color,
        fontWeight: weight==true? FontWeight.bold:FontWeight.w100

    );
  }
}

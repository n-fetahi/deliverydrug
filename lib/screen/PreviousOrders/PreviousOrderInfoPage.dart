import 'dart:async';
import 'dart:ui';
import 'package:deliverydrug/screen/PreviousOrders/PreviousOrderListPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../constant/DefultBotton.dart';
import '../../constant/Lists.dart';
import '../../constant/Navigators.dart';
import '../../main.dart';

class PreviousOrderInfoPage extends StatefulWidget {
  const PreviousOrderInfoPage({Key? key, required this.order, required this.orderDetails}) : super(key: key);

  final List<Map> order;
  final Map orderDetails;
  @override
  State<PreviousOrderInfoPage> createState() => _PreviousOrderInfoPageState();
}

class _PreviousOrderInfoPageState extends State<PreviousOrderInfoPage> {
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child:
                  Column(
                          children: [
                            Text('تفاصيل الطلب',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo'
                            ),
                            ),
                            SizedBox(height: getheightScreen(30),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                titleText('الإسـم'),
                                titleText('الـسعــر')

                              ],
                            ),
                            Divider(color: primaryColor,thickness: 1.5,height: 30,),

                            Column(
                              children: widget.order.map((e) => Order(e['name'],e['price'])).toList() ,
                            ),


                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                totalText('الإجمالي',Colors.black),
                                totalText('${widget.orderDetails['total']} ريال',primaryColor),


                              ],
                            ),
                            Divider(color: primaryColor,thickness: 1.5,height: 30,),

                            Container(
                              padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xA9D7D9D9),
                                ),
                              margin: EdgeInsets.only(top: 30),
                              child: Column(
                                children: [

                                  customerInfo('عنوان التوصيل','${widget.orderDetails['street']}، ${widget.orderDetails['area']}، ${widget.orderDetails['town']}'),
                                  SizedBox(height: getheightScreen(10),),
                                  customerInfo(' رقم الحساب البنكي','${widget.orderDetails['accountNumber']}'),
                                  SizedBox(height: getheightScreen(10),),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 10,top: 30),
                                child: DefultButton("إعادة الطلب",false, (){

                                  showGeneralDialog(
                                    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
                                      child: FadeTransition(
                                        child: child,
                                        opacity: anim1,
                                      ),
                                    ),
                                    context: context,
                                    barrierColor: Colors.black.withOpacity(0.5),
                                    pageBuilder: (_, __, ___) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: Center(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white, // Dialog background

                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            margin: EdgeInsets.symmetric(horizontal: 20),
                                            width: double.infinity/3, // Dialog width
                                            child: SingleChildScrollView(
                                              child: Container(
                                                width: double.infinity,
                                                padding: EdgeInsets.symmetric(vertical: 20),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Center(
                                                      child: Expanded(
                                                        child: Text('هل أنت متأكد من رغبتك من إعادة إرسال الطلب؟',
                                                        style: TextStyle(
                                                          fontFamily: 'Cairo',
                                                          fontWeight: FontWeight.bold
                                                        ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: getheightScreen(20),),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [

                                                        Container(
                                                          height: 50,
                                                          width: 100,
                                                          margin: EdgeInsets.all(10),
                                                          child: DefultButton('إلغاء', true, (){
                                                            popNavigator(context);
                                                          }, context),
                                                        ),
                                                        Container(
                                                          height: 50,
                                                          width: 100,
                                                          margin: EdgeInsets.all(10),
                                                          child: DefultButton('تأكيد', false, (){
                                                            previousOrderList.add({
                                                              'orderID':++orderID,
                                                              'order':widget.order,
                                                              'orderDetails':widget.orderDetails
                                                            });

                                                            Fluttertoast.showToast(
                                                                msg: "تمت إعادة إرسال الطلب مرة أخرى",
                                                                toastLength: Toast.LENGTH_LONG,
                                                                gravity: ToastGravity.BOTTOM,
                                                                timeInSecForIosWeb: 3,
                                                                textColor: Colors.white,
                                                                fontSize: 16.0,
                                                                backgroundColor: primaryColor
                                                            );
                                                            Timer(
                                                                Duration(seconds: 4),
                                                                    (){pushNavigator(PreviousOrderListPage(),context);}
                                                            );

                                                          }, context),
                                                        ),

                                                      ],

                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },context))
                          ],
                        ),



              ),
            ),
          ),

        ),
      ),
      
    );
  }

  Text totalText(String text,Color color) {
    return Text(text,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 17,
                        color: color,
                        fontWeight: FontWeight.bold
                      ),
                      );
  }

  Widget customerInfo(String title,String subTitle) {
    return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      infoText(title,FontWeight.bold,15),
                      infoText(subTitle,FontWeight.w100,13),

                    ],
                  );
  }

  Widget infoText(String text,FontWeight weight,double fontSize) {
    return Expanded(
      child: Text(text,
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: weight,
                          fontSize: fontSize
                        ),
                        ),
    );
  }

  Widget Order(String orderName,double orderPrice) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getheightScreen(5)),
      child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: subTitleText(orderName)),
                        Container(
                            margin: EdgeInsets.only(right: getWidthScreen(20),left: getWidthScreen(8)),
                            child: subTitleText(orderPrice.toString()))
                      ],
                    ),
                    Divider(color: Colors.black,endIndent: 10,indent: 10,)
                  ],
                ),
    );
  }

  Widget subTitleText(String text) {
    return Text(text,
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 14
                      ),
                      );
  }

  Widget titleText(String text) {
    return Text(text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
                fontFamily: 'Cairo'
              ),
              );
  }
}

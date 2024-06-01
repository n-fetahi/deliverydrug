import 'package:deliverydrug/constant/constant.dart';
import 'package:deliverydrug/constant/paymentAppBar.dart';
import 'package:deliverydrug/constant/paymentButton.dart';
import 'package:deliverydrug/screen/CartPages/paymentPage.dart';
import 'package:deliverydrug/screen/cartPages/OrderDetailsPage.dart';
import 'package:deliverydrug/screen/cartPages/Page2.dart';
import 'package:deliverydrug/screen/cartPages/Page3.dart';
import 'package:deliverydrug/screen/cartPages/ReportPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:deliverydrug/main.dart';
import '../constant/Lists.dart';
import '../constant/Navigators.dart';
import 'CartPages/paymentDatePage.dart';
import 'cartPages/Page1.dart';

import '../constant/SizeConfig.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int _currentIndex = 0;
  int count = 0;
  PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 100, bottom: 20),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Container(
                    height: 700,
                    child: PageView.builder(
                        // scrollDirection: ,
                        physics: NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              index == 0
                                  ? paymentAppBar('تاريخ الدفع', () {
                                      popNavigator(context);
                                    }, context)
                                  : SizedBox(),
                              index == 1
                                  ? paymentAppBar('الدفع', () {
                                      back();
                                    }, context)
                                  : SizedBox(),
                              index == 2
                                  ? paymentAppBar('الدفع', () {
                                      back();
                                    }, context)
                                  : SizedBox(),
                              index == 3
                                  ? paymentAppBar('الدفع', () {
                                      back();
                                    }, context)
                                  : SizedBox(),
                              index == 4
                                  ? paymentAppBar('تفاصيل الطلب', () {
                                      back();
                                    }, context)
                                  : SizedBox(),
                              index==5?paymentAppBar('وسيلة الدفع', () {
                                back();
                              }, context):SizedBox(),
                              index == 6
                                  ?  Center(
                          child:   Text('تقرير',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold
                          ),
                          ),
                          )
                                  : SizedBox(),
                              SizedBox(
                                height: getheightScreen(50),
                              ),
                              index >= 1 && index <= 3
                                  ? Row(
                                      children: [
                                        StepperComponent(
                                          currentIndex: _currentIndex - 1,
                                          index: 0,
                                          onTap: () {},
                                        ),
                                        StepperComponent(
                                          currentIndex: _currentIndex - 1,
                                          index: 1,
                                          onTap: () {},
                                        ),
                                        StepperComponent(
                                          currentIndex: _currentIndex - 1,
                                          index: 2,
                                          isLast: true,
                                          onTap: () {},
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                              index == 0 ? paymentDatePage() : SizedBox(),
                              index == 1 ? Page1() : SizedBox(),
                              index == 2 ? Page2() : SizedBox(),
                              index == 3 ? Page3() : SizedBox(),
                              index == 4 ? OrderDetailsPage() : SizedBox(),
                              index == 5 ? PaymentPage() : SizedBox(),
                              index == 6 ? ReportPage() : SizedBox(),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            index != 6
                                                ?
                                            paymentButton(
                                                    primaryColor,
                                                    Colors.white,
                                                    index == 5
                                                        ? 'إدفــع'
                                                        : 'التالي',
                                                    12,
                                                    55, () {
                                                    setState(() {
                                                      if(purchaseList.isEmpty){
                                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                                          backgroundColor: Colors.redAccent,
                                                          content:  Text('أنت لم تقم بشراء أي شيء، للإستمرار قم بالشراء',
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                              fontFamily: 'Cairo',
                                                            ),
                                                          ),
                                                        ));
                                                      }
                                                      else{
                                                        ++count;
                                                        if (count >= 6) {
                                                          previousOrderList.add({
                                                            'orderID':++orderID,
                                                            'order':purchaseList,
                                                            'orderDetails':orderDetailsList
                                                          });

                                                          purchaseList=[];
                                                          orderDetailsList={};
                                                          count = 6;
                                                        }
                                                        _currentIndex = count;
                                                      }
                                                    });
                                                    _pageController
                                                        .jumpToPage(count);
                                                  }, context)
                                                : SizedBox(),
                                            SizedBox(
                                              width: getWidthScreen(20),
                                            ),
                                            index != 0 &&
                                                    index != 1 &&
                                                    index != 6
                                                ? paymentButton(
                                                    Colors.white,
                                                    primaryColor,
                                                    'العودة',
                                                    12,
                                                    55, () {
                                                    back();
                                                  }, context)
                                                : SizedBox()
                                          ]),
                                    ],
                                  ),
                                  height: double.infinity,
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void back() {
    setState(() {
      --count;
      if (count < 0) {
        count = 0;
      }
      _currentIndex = count;
    });
    _pageController.jumpToPage(count);
  }
}

class StepperComponent extends StatelessWidget {
  int index;

  List paymentStepsTitles = [
    'التوصيل',
    'العنوان',
    'الــدفــع',
  ];

  int currentIndex;

  VoidCallback onTap;
  bool isLast;

  StepperComponent({
    super.key,
    required this.currentIndex,
    required this.index,
    required this.onTap,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    //widget
    return isLast
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  //this is the bubble
                  Container(
                      width: 40,
                      height: 40,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              color: index == currentIndex
                                  ? primaryColor
                                  : Colors.black12)),
                      child: currentIndex >= index
                          ? Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: primaryColor,
                                border: Border.all(color: primaryColor),
                              ),
                            )
                          : null),

                  //this the ligne
                  Container(
                    height: 2,
                    //why index+1 we want to turn the ligne orange that precede the active bubble
                    color: currentIndex >= index + 1
                        ? primaryColor
                        : Colors.black12,
                  ),
                ],
              ),
              //index+1 we dont wanna show 0 in the screen since our index will start at 0
              Text(
                '${paymentStepsTitles[index]}',
                style: currentIndex >= index
                    ? paymentStepsTitlesStyle(Colors.black)
                    : paymentStepsTitlesStyle(Colors.black38),
              ),
            ],
          )
        : Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //this is the bubble
                    Container(
                        width: 40,
                        height: 40,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: index == currentIndex
                                    ? primaryColor
                                    : Colors.black12)),
                        child: currentIndex >= index
                            ? Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: primaryColor,
                                  border: Border.all(color: primaryColor),
                                ),
                              )
                            : null),
                    //this the ligne
                    Expanded(
                        child: Container(
                      height: 2,
                      //why index+1 we want to turn the ligne orange that precede the active bubble
                      color: currentIndex >= index + 1
                          ? primaryColor
                          : Colors.black12,
                    )),
                  ],
                ),
                //index+1 we dont wanna show 0 in the screen since our index will start at 0
                Text(
                  '${paymentStepsTitles[index]}',
                  style: currentIndex >= index
                      ? paymentStepsTitlesStyle(Colors.black)
                      : paymentStepsTitlesStyle(Colors.black38),
                ),
              ],
            ),
          );
  }

  TextStyle paymentStepsTitlesStyle(Color? color) {
    return TextStyle(fontSize: 12, fontFamily: 'Cairo', color: color);
  }
}

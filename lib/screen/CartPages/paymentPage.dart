import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/Lists.dart';
import '../../constant/addButton.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int current=0;
  double total=0;
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    for(int i=0;i<purchaseList.length;i++){
      total+=purchaseList[i]['price'];
    }
    orderDetailsList.addAll(
        {
          'total':total
        });
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentItemsDesign(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('إجمالي الطلبية',
                  style: titlesTexts,),

                Row(
                  children: [
                    buildText(25,'$total'),
                    SizedBox(width: 2,),
                    buildText(15,'ريال')

                  ],
                ),


              ],
            )
            ),
            SizedBox(height: getheightScreen(30),),
            Text('إختيار وسيلة دفع',
            style: secondTextStyle,
            ),
            PaymentInstrument(
              current: current,
              img: 'assets/SvgPicture/visa-svgrepo-com.svg',
              name: 'الدفع بإستخدام فيزا',
              index: 0,
              onTap: (){
                setState((){
                  current=0;
                });
              },

            ),
            PaymentInstrument(
              current: current,
              img: 'assets/SvgPicture/paypal-svgrepo-com.svg',
              name: 'الدفع بإستخدام بايبال',
              index: 1,
              onTap: (){
                setState((){
                  current=1;
                });
              },
            ),
            PaymentInstrument(
              current: current,
              img: 'assets/SvgPicture/delivery-svgrepo-com.svg',
              name: 'الدفع عند الإستلام ',
              index: 2,
              onTap: (){
                setState((){
                  current=2;
                });
                },
            ),

          ],
        );

  }

  Text buildText(double size,String text) {
    return Text(text,
                  style:TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cairo',
                    fontSize: size
                  ),);
  }
}

class PaymentInstrument extends StatefulWidget {
  const PaymentInstrument({
    Key? key, required this.name, required this.img, required this.index, required this.current, required this.onTap,
  }) : super(key: key);
  final String name;
  final String img;
  final  int index;
  final  int current;
  final  Function onTap;

  @override
  State<PaymentInstrument> createState() => _PaymentInstrumentState();
}

class _PaymentInstrumentState extends State<PaymentInstrument> {
  @override
  Widget build(BuildContext context) {

    return PaymentItemsDesign(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: widget.onTap as void Function(),
                  child: Container(
                      width: 25,
                      height: 25,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              color: widget.current==widget.index?primaryColor:Colors.black26)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: widget.current==widget.index?primaryColor:Colors.black26,

                        ),
                      )
                  ),
                ),
                SizedBox(width: getWidthScreen(7),),
                Text(widget.name,
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

           Row(
             children: [
               SvgPicture.asset(
                 widget.img,
                 height: 40,
                 width: 40,
               ),
               SizedBox(width: getWidthScreen(5),),

               Directionality(
                   textDirection: TextDirection.ltr,
                   child:InkWell(
                     child: Icon(Icons.arrow_back_ios_new),
                   )
               )
             ],
           )
          ],
        )
    );
  }
}

class PaymentItemsDesign extends StatelessWidget {
  const PaymentItemsDesign({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFCD7D9D9),
      ),
      width: double.infinity,
      child: child,
    );
  }
}

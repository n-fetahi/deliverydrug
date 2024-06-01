
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constant/DefultBotton.dart';
import '../constant/Lists.dart';
import '../constant/MyBottomBar.dart';
import '../constant/MyFloatingActionButton.dart';
import '../constant/SizeConfig.dart';
import '../constant/constant.dart';


// import '../constant/BottomBarSwitch.dart';
//import 'package:alsarabi_restorint/constant/BottonBar2.dart';


class BuyItemPage extends StatefulWidget {
  BuyItemPage({Key? key, required this.name, required this.img, required this.price, required this.disc}) : super(key: key);
  final String name;
  final String img;
  final double price;
  final String disc;


  @override
  State<BuyItemPage> createState() => _BuyItemPageState();
}

class _BuyItemPageState extends State<BuyItemPage> {
  int count=1;
  String addText='';

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: MyBottomBar(
        index: 2,),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: MyFloatingActionButton(),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center ,
            children: [
              SizedBox(
                height: getheightScreen(30),
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 1,

                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child:  ClipRRect(
                  child: Image.asset(widget.img,
                    fit:BoxFit.cover ,
                    height: getheightScreen(300),
                    width:SizeOfConfig.widthScreen-50,
                  ),

                ),
              ),
              SizedBox(
                height: getheightScreen(20),
              ),

                SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                   Row(
                     crossAxisAlignment: CrossAxisAlignment.end,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,

                     children: [

                       Container(
                         width: getWidthScreen(100),
                         height: getheightScreen(40),
                         padding: EdgeInsets.symmetric(horizontal: 5),
                         decoration: BoxDecoration(
                             border: Border.all(color: primaryColor,width: 2),
                             borderRadius: BorderRadius.circular(15)
                         ),
                         child:
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             InkWell(
                                 onTap: (){

                                   setState((){
                                     count++;
                                   });
                                 },
                                 child: Icon(Icons.add)),
                             Container(
                               width: getWidthScreen(50),
                               child: TextField(
                                 textAlign: TextAlign.center,
                                 onChanged: (value){},
                                 onTap: (){},
                                 enabled: false,
                                 decoration: InputDecoration(
                                   contentPadding: const EdgeInsets.all(10),
                                   hintText: '$count',
                                   hintStyle: const TextStyle(
                                     fontSize: 20,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                   ),

                                 ),
                               ),
                             ),
                             InkWell(
                                 onTap: (){

                                   setState((){
                                     if(count<=1){
                                       count=1;
                                     }
                                     else{
                                       count--;
                                     }
                                   });
                                 },
                                 child: Icon(Icons.remove)),

                           ],
                         ),
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Text(widget.name,
                             style: TextStyle(
                                 fontWeight: FontWeight.bold,
                                 fontFamily: 'Cairo',
                                 fontSize: 22
                             ),
                           ),
                           Text('Analgesic',
                           style: secondTextStyle,
                           ),
                           Row(
                             children: [
                               Text('YR',
                               style:priceText,
                               ),
                               Text(' ${widget.price} ',
                                 style: priceText
                               ),
                             ],
                           ),
                         ],
                       ),
                     ],
                   ),




                    SizedBox(
                      height: getheightScreen(10),
                    ),

                    Container(
                      height: 150,
                      child: SingleChildScrollView(
                        child: Text('eyqrfwhuifrqfhiujfjkhrfdyruiyeuin4ycuiry4uyruyer weuhyd qjehiu',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 14
                          ),
                        ),

                      ),
                    ),


                  ],
              ),
                ),
              Center(
                child: Container(
                  width: getWidthScreen(200),
                  child:DefultButton("أضف إلى السلة",false, (){
                    purchaseList.add({
                      'name':widget.name,
                      'img':widget.img,
                      'price':widget.price
                    });

                    print(purchaseList);
                    Fluttertoast.showToast(
                        msg: "تمت الاضافة إلى السلة بنجاح",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0,
                        backgroundColor: primaryColor
                    );
                  },context),

                ),
              )

            ],
          ),
        ),



    );
  }
}
 
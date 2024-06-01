import 'package:flutter/material.dart';

import 'SearchText.dart';
import 'SizeConfig.dart';
import 'constant.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key, this.name, this.subTitle, this.img ,
    this.leading=const Icon(Icons.list_outlined, size: 35,)
    ,this.trailing=const Icon(Icons.shopping_cart_rounded,size: 30),this.isHome=false,this.SearchText})
      : super(key: key);
  final String ?name;
  final String ?subTitle;
  final String ?img;
  final Widget leading;
  final Widget trailing;
  final bool ?isHome;
  final Widget ?SearchText;




  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return  Directionality(
      textDirection: TextDirection.ltr,
      child: AppBar(
            leading: widget.leading,
            flexibleSpace:
           widget.name!=null&& widget.subTitle!=null&& widget.img!=null?Container(
             width: double.infinity,
              // color: Colors.black,
              padding: EdgeInsets.only(bottom: widget.isHome==false?50:10, right: 50),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [

                        CircleAvatar(
                          radius: getheightScreen(25),
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(widget.img!,),
                        ),
                        SizedBox(
                          width: getWidthScreen(10),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                        mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                               widget.name!,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              widget.subTitle!,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.white,
                                  fontSize: 12),
                            ),
                          ],
                        ),

                      ],
                    ),
                    widget.isHome==true?Container(
                        // height: getheightScreen(60),
                        margin: EdgeInsets.only(left: 40),
                        // padding: EdgeInsets.symmetric(horizontal: 10),
                        child: widget.SearchText
                    ):SizedBox(),

                  ],
                ),
              ),
            ):SizedBox(),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child:  widget.trailing,
              ),
            ],
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
      ),
    );
  }
}


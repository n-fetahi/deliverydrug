import 'package:flutter/material.dart';

import 'SizeConfig.dart';
import 'constant.dart';

class CheckMark extends StatefulWidget {
   CheckMark({Key? key,  this.text,this.flage ,this.disabled=false}) : super(key: key);
  bool ?flage;
  final String ?text;
   final disabled;


   @override
  State<CheckMark> createState() => _CheckMarkState();
}

class _CheckMarkState extends State<CheckMark> {
  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: widget.disabled?null: (){
        setState((){
          if(widget.flage==false)
            widget.flage=true;
          else
            widget.flage=false;
        });
      },
      child: Row(

        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            height: getheightScreen(25),
            width: getWidthScreen(22),
            decoration: BoxDecoration(
                color:widget.flage==true?primaryColor:Colors.white,

                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.black12)
            ),
            child: widget.flage==true?Container(
                child: Icon(Icons.check_sharp,size: 20,color: Colors.white))
                :SizedBox(),
          ),
          SizedBox(width: getWidthScreen(5),),
          widget.text!=null? Text(widget.text!,
            style: TextStyle(
                fontFamily: 'Cairo',
                fontSize: 13
            ),
          ):SizedBox(),

        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'SizeConfig.dart';
import 'constant.dart';

class ItemsTemplate extends StatelessWidget {
  const ItemsTemplate({Key? key, required this.img, required this.size, required this.itemName, this.price, }) : super(key: key);
   final String img;
   final double size;
   final String itemName;
   final double ?price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(

                border: Border.all(color: primaryColor,width: 3),
                borderRadius: BorderRadius.circular(20)

            ),
            height: getheightScreen(size),
            width: getWidthScreen(size),

            child:ClipRRect(
              borderRadius: BorderRadius.circular(17),
              child: Image.asset(img,
              fit: price!=null? BoxFit.cover:null,
              ),
            )
        ),
        SizedBox(height: getheightScreen(5),),

        Text(itemName,
          style: TextStyle(
              fontSize: 13,
              fontFamily: 'Cairo'
          ),),
        price!=null ?Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            "$price RY",
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 13,
                fontFamily: 'Cairo'
            ),

          ),
        ):SizedBox()
      ],
    );
  }
}

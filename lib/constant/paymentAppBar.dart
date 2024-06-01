import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'SizeConfig.dart';

Widget paymentAppBar(String title,Function () press,BuildContext context) {
  SizeOfConfig().init(context);
  return Stack(
    alignment: Alignment.centerLeft,
    children: [
      Center(
        child:   Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold
              ),
            ),
      ),

      InkWell(
        onTap: press as Function(),
        child: SvgPicture.asset(
          'assets/SvgPicture/back-arrow.svg',
          height: getheightScreen(20),
          width: getWidthScreen(20),
        ),
      )
    ],
  );
}
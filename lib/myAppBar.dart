import 'package:flutter/material.dart';

AppBar myAppBar(String title,BuildContext context) {
  return AppBar(
    title: Text(title),
    titleSpacing: 00.0,
    centerTitle: true,
    toolbarHeight: 60.2,
    toolbarOpacity: 0.8,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25)),
    ),
    elevation: 0.00,
    backgroundColor: Colors.greenAccent[400],
    actions:[
      Container(
        margin: EdgeInsets.only(left: 10),
        child: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new),
        ),
      )
    ],
  );
}
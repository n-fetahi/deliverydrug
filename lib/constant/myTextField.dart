import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key, required this.icon, required this.hintText}) : super(key: key);
  final IconData icon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: TextField(
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: hintText,
          prefixIcon: Container(
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 1.5,
                  color: Colors.black38
                )
              )
            ),
            child: Icon(icon),
          ),

        ),
      ),
    );
  }
}

import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  final List <String> errors;
  const FormError({
    Key? key,
    required this.errors

  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children:
        List.generate(errors.length, (index) =>formErrorText(error: errors[index]))
      ),
    );
  }
  Row formErrorText({required String error}){

    return Row(
      children: [
        SizedBox(
          width: getheightScreen(14),
        ),
        SizedBox(
          width: getheightScreen(14),
        ),
        Text(error ,
        style: TextStyle(
          fontFamily: 'Cairo',
          color: Color(0xFFFF0000),
          fontSize: 12
        ),)
      ],
    );
  }
}

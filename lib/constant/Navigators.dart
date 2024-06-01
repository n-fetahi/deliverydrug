import 'package:flutter/material.dart';
import '../screen/SignInPage.dart';

 pushNavigator(pageName,BuildContext context){
  Navigator.push(context,
      MaterialPageRoute(
          builder:(context)=>pageName
      )
  );
}

popNavigator(BuildContext context){
  Navigator.pop(context);
}
import 'package:flutter/material.dart';

import 'Navigators.dart';

formCurrentState(GlobalKey<FormState> _formKey,pageNavigator,BuildContext context){
    var formData=_formKey.currentState;
    if(formData!.validate()){
      pushNavigator(pageNavigator, context);
    }

}
import 'package:deliverydrug/constant/Navigators.dart';
import 'package:deliverydrug/screen/HomePage.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constant/DefultBotton.dart';
import '../constant/FormError.dart';
import '../constant/MyInkWell.dart';
import '../constant/SizeConfig.dart';
import '../constant/constant.dart';
import '../constant/formCurrentState.dart';

import 'package:email_otp/email_otp.dart';


class VerificationCodePage extends StatefulWidget {

  const VerificationCodePage({Key? key,required this.myauth,required this.userEmail}) : super(key: key);
  final EmailOTP myauth ;
  final userEmail;
  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final _formKey=GlobalKey<FormState>();
  final  verificationCode='';
 List verificationCodeController=[
   TextEditingController(),
   TextEditingController(),
   TextEditingController(),
   TextEditingController(),

 ];


  bool error=false;
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 26, right: 26),
            child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              SizedBox(
                height: getheightScreen(70),
              ),
               Center(
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'لقد تم إرسال رمز التحقق إلى هاتفك',
                      style: TextStyle(
                          fontSize: getWidthScreen(15),
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'يرجى إدخال رمز التحقق الذي تم إرساله إليك',
                      style: secondTextStyle,
                    ),
                  ],
              ),
               ),
              SizedBox(
                height: getheightScreen(50),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  height: getheightScreen(55),
                  width: SizeOfConfig.widthScreen,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {

                        return Container(
                          // color: Colors.black,

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          height: getheightScreen(55),
                          width: getWidthScreen(45),
                          child: TextFormField(
                            controller: verificationCodeController[index],
                            onChanged: (value){
                              if(value.length==1){
                                FocusScope.of(context).nextFocus();
                              }
                              else if(value.length==0){
                                FocusScope.of(context).previousFocus();
                              }
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            style: TextStyle(
                                fontSize: 23,
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 5, top: 10, bottom: 20),
                              fillColor: Color(0x99BABABD),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  gapPadding: 20,
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    width: 0,
                                  )),

                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                  const BorderSide(color: Color(0xB6061C1C))),
                            ),
                          ),
                        );

                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 35,
                          ),
                      itemCount: 4),
                ),
              ),
              SizedBox(height: getheightScreen(20),),




                  DefultButton("التالي", false, ()async{
                    error=false;
                    print(verificationCodeController.length);
                    for(int i=0;i<verificationCodeController.length;i++){
                      if(verificationCodeController[i].text==''){
                        error=true;
                      }
                    }

                    print(error.toString());

                    if(error==false){

                      if (await widget.myauth.verifyOTP(otp: verificationCodeController[0].text +
                      verificationCodeController[1].text +
                      verificationCodeController[2].text +
                      verificationCodeController[3].text) == true) {

                    pushNavigator(HomePage(), context);

                      } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.redAccent,
                    content:  Text("تأكد من ادخال رمز التأكيد بشكل صحيح",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Cairo',

                    ),
                    ),
                    ));
                    }
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.redAccent,
                        content:  Text('رجاءً قم بملء الحقول',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ));
                    }
              }, context),
              SizedBox(
                height: getheightScreen(30),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'لم يصلك الرمز؟',
                    style: secondTextStyle,
                  ),
                  // SizedBox(height: getheightScreen(10),),

                  myInlWell("الإرسال من جديد", () async{
                    widget.myauth.setConfig(
                        appEmail: "contact@hdevcoder.com",
                        appName: "Email OTP",
                        userEmail: widget.userEmail,
                        otpLength: 4,
                        otpType: OTPType.digitsOnly);

                    if (await widget.myauth.sendOTP() == true) {
                      Fluttertoast.showToast(
                          msg: "تم إرسال الرمز إليك مجدداً",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 2,
                          textColor: Colors.white,
                          fontSize: 16.0,
                          backgroundColor: primaryColor
                      );


                    } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.redAccent,
                    content:  Text('هناك خطأ ما، حاول إرسال الرمز مجدداً',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontFamily: 'Cairo',
                    ),
                    ),
                    ));
                    }


                    Fluttertoast.showToast(
                        msg: "تم إرسال الرمز إليك مجدداً",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 2,
                        textColor: Colors.white,
                        fontSize: 16.0,
                        backgroundColor: primaryColor
                    );


                  }),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

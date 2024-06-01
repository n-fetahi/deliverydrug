import 'package:deliverydrug/constant/MyInkWell.dart';
import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/TextForm.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:deliverydrug/screen/SignInPage.dart';
import 'package:deliverydrug/screen/verificationCodePage.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import '../../constant/FormError.dart';
import '../../constant/TextForm.dart';
import '../../constant/DefultBotton.dart';
import '../constant/Navigators.dart';
import '../constant/formCurrentState.dart';



class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool flage=true;
  bool emailError=true;
  bool passwordError=true;
  bool makeSurePasswordError=true;
  bool nameError=true;
  bool phoneNumberError=true;
  bool addressError=true;

  EmailOTP myauth = EmailOTP();


  final emailControll=TextEditingController();
  final passwordControll=TextEditingController();
  final makeSurepasswordControll=TextEditingController();
  final nameControll=TextEditingController();
  final phoneNumberControll=TextEditingController();
  final addressControll=TextEditingController();
  void dispose(){
    emailControll.dispose();
    passwordControll.dispose();
    super.dispose();
  }
  String? email;
  String? password;
  String? name;
  String ?phoneNumber;
  String ?address;
  final _formKey=GlobalKey<FormState>();

  final List<String> errors=[];

  void addError({String? error}){
    if (!errors.contains(error!))
      setState(() {
        errors.add(error);
      });
  }


  void removeError({String? error}){
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }


  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Form(
      key: _formKey,
      child: Scaffold(

        body: SafeArea(
          child: Stack(
            children: [
              Padding(padding: EdgeInsets.only(left: 26,right: 26),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: getheightScreen(50),),
                      Text('تسجيل الإشتراك' ,style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold
                      ),),
                      Text('ادخل معلوماتك لتسجيل الدخول' ,style:secondTextStyle ,),
                      SizedBox(height: getheightScreen(40),),
                      TextForm(
                        controller: nameControll,
                        obscureText: false,
                        myKey: TextInputType.name,
                        lableText: 'الاسم',
                        error: nameError,
                        validation: (value){
                          if (value!.isEmpty){
                            addError(error: kNameNullError);
                            return "";
                          }
                          if(flage==false)
                            return "";
                          return null;
                        },
                        press: (value){

                          if(value!.isEmpty){
                            flage=false;
                            nameError=true;
                            addError(error: kNameNullError);
                          }
                          if(value.isNotEmpty){
                            flage=true;
                            nameError=false;
                            name=value.toString();
                            removeError(error: kNameNullError);
                          }


                        },
                      ),
                      SizedBox(height: getheightScreen(20),),
                      TextForm(
                        obscureText: false,
                        controller: emailControll,
                        myKey: TextInputType.emailAddress,
                        lableText: 'الإيميل',
                        error: emailError,
                        validation: (value){
                          if (value!.isEmpty){
                            addError(error: kEmailNullError);
                            return "";
                          }
                          if(flage==false)
                            return "";
                          return null;
                        },
                        press: (value){

                          {
                            if (value!.isEmpty){
                              addError(error: kEmailNullError);

                            }
                            else if (!emailValidatorRegExp.hasMatch(value)){
                              flage=false;
                              emailError=true;
                              addError(error: kInvalidEmailError);

                            }
                          }
                          if (value.isNotEmpty){

                            removeError(error: kEmailNullError);
                          }
                          if (emailValidatorRegExp.hasMatch(value) || value.isEmpty){
                            flage=true;
                            emailError=false;
                            email=value.toString();
                            removeError(error: kInvalidEmailError);
                          }
                        },
                      ),

                      SizedBox(height: getheightScreen(20),),
                      TextForm(
                        controller: phoneNumberControll,
                        obscureText: false,
                        error: phoneNumberError,
                        myKey: TextInputType.number,
                        lableText: 'رقم الهاتف',
                        validation: (value){
                          if (value!.isEmpty){
                            addError(error: kPhoneNumberNullError);
                            return "";
                          }
                          if(flage==false)
                            return "";
                          return null;
                        },
                        press: (value){

                          {
                            if (value!.isEmpty){
                              addError(error: kPhoneNumberNullError);
                            }
                            else if (!phoneNumberValidatorRegExp.hasMatch(value)){
                              flage=false;
                              phoneNumberError=true;
                              addError(error: kInvalidphoneNumberError);
                            }
                          }
                          if (value.isNotEmpty){
                            removeError(error: kPhoneNumberNullError);
                          }
                          if (phoneNumberValidatorRegExp.hasMatch(value) || value.isEmpty){
                            flage=true;
                            phoneNumberError=false;
                            phoneNumber=value.toString();
                            removeError(error: kInvalidphoneNumberError);
                          }
                        },
                      ),
                      SizedBox(height: getheightScreen(20),),
                      TextForm(
                        controller: addressControll,
                        obscureText: false,
                        error: addressError,
                        myKey: TextInputType.streetAddress,
                        lableText: 'العنوان',
                        validation: (value){
                          if (value!.isEmpty){
                            addError(error: kAddressNullError);
                            return "";
                          }
                          if(flage==false)
                            return "";
                          return null;
                        },
                        press: (value){

                          if (value!.isEmpty){
                            flage=false;
                            addressError=true;
                            addError(error: kAddressNullError);

                          }
                          if (value.isNotEmpty){
                            flage=true;
                            addressError=false;
                            address=value.toString();
                            removeError(error: kAddressNullError);
                          }
                        },
                      ),
                      SizedBox(height: getheightScreen(20),),
                      TextForm(
                        obscureText: true,
                        controller: passwordControll,
                        myKey: TextInputType.text,
                        lableText: 'كلمة السر',
                        error: passwordError,
                        validation: (value){
                          if(value!.isEmpty){
                            addError(error: kPassNullError);
                            return "";
                          }
                          if(flage==false)
                            return "";
                          return null;
                        },
                        press: (value){

                          {
                            if(value!.isEmpty){
                              addError(error: kPassNullError);
                            }
                            else if(value.length<8){
                              flage=false;
                              passwordError=true;
                              addError(error: kShortPassError);
                            }
                          }
                          if(value.isNotEmpty){
                            removeError(error: kPassNullError);
                          }
                          if(value.length >= 8 || value.isEmpty){
                            flage=true;
                            passwordError=false;
                            removeError(error: kShortPassError);
                          }
                        },
                      ),
                      SizedBox(height: getheightScreen(20),),
                      TextForm(
                        obscureText: true,
                        controller:makeSurepasswordControll,
                        myKey: TextInputType.text,
                        lableText: 'تأكيد كلمة السر',
                        error: makeSurePasswordError,
                        validation: (value){
                          if(value!.isEmpty){
                            addError(error: kMakeSurePassNullError);
                            return "";
                          }
                          if(value!=passwordControll.text){
                            addError(error: kMatchPassError);
                            return "";
                          }
                          if(flage==false)
                            return "";
                          return null;
                        },
                        press: (value){

                          if(value!.isEmpty){
                            flage=false;
                              addError(error: kMakeSurePassNullError);
                            }
                          if(value.isNotEmpty){
                            removeError(error: kMakeSurePassNullError);
                          }
                          if(value==passwordControll.text){
                            flage=true;
                            password=value.toString();
                            removeError(error: kMatchPassError);
                          }
                          },
                      ),
                      FormError(errors: errors,),

                      SizedBox(height: getheightScreen(20),),
                      DefultButton("تسجيل الإشتراك",false, () async{
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context)=>Center(
                              child: CircularProgressIndicator(),
                            ));
                        myauth.setConfig(
                            appEmail: "contact@hdevcoder.com",
                            appName: "Email OTP",
                            userEmail: emailControll.text,
                            otpLength: 4,
                            otpType: OTPType.digitsOnly);
                        if (await myauth.sendOTP() == true) {
                          print("-------------------------------------------------------");

                        formCurrentState(_formKey,VerificationCodePage(myauth: myauth,userEmail: emailControll.text),context);

                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            backgroundColor: Colors.redAccent,
                            content:  Text('تأكد من صحة بريدك الإلكتروني',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ));
                        }

                      },context),

                      SizedBox(height: getheightScreen(20),),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("لديك حساب سابق؟ ",
                          style: TextStyle(
                            color: Color(0x99183765),
                            fontSize: 15,
                            fontFamily: 'Cairo',
                          ),
                          ),
                          myInlWell("تسجيل الدخول", (){
                            pushNavigator(SignInPage(), context);
                          })
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


import 'package:deliverydrug/constant/MyInkWell.dart';
import 'package:deliverydrug/constant/Navigators.dart';
import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/TextForm.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:deliverydrug/screen/HomePage.dart';
import 'package:deliverydrug/screen/SignUpPage.dart';
import 'package:flutter/material.dart';
import '../../constant/FormError.dart';
import '../../constant/TextForm.dart';
import '../../constant/DefultBotton.dart';
import '../../constant/ButtonItem.dart';
import '../constant/formCurrentState.dart';



class SignInPage extends StatefulWidget {

  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool flage=true;
  bool emailError=true;
  bool passwordError=true;

  final emailControll=TextEditingController();
  final passwordControll=TextEditingController();
  void dispose(){
    emailControll.dispose();
    passwordControll.dispose();
    super.dispose();
  }
  String? email;
  String? password;
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
                      Text('تسجيل الدخول' ,style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold
                      ),),


                      Text('ادخل معلوماتك لتسجيل الدخول' ,style:secondTextStyle ,),
                      SizedBox(height: getheightScreen(40),),
                      TextForm(
                        obscureText: false,
                        icon: Icons.abc,
                        error: emailError,
                        controller: emailControll,
                        myKey: TextInputType.emailAddress,
                        lableText: 'الإيميل / الرقم',
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
                        obscureText: true,
                        controller: passwordControll,
                        myKey: TextInputType.text,
                        error: passwordError,
                        lableText: 'كلمة السر',
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
                            password=value.toString();
                            removeError(error: kShortPassError);
                          }
                        },
                      ),
                      FormError(errors: errors,),
                      SizedBox(height: getheightScreen(30),),
                      DefultButton("تسجيل الدخول",false, (){
                        formCurrentState(_formKey,HomePage(),context);
                      },context),
                      SizedBox(height: getheightScreen(20),),
                      Text('هل نسيت كلمة السر؟' ,style:secondTextStyle ,),

                      SizedBox(height: getheightScreen(40),),
                      Text('أو تسجيل الدخول عبر' ,style:secondTextStyle ,),
                      SizedBox(height: getheightScreen(20),),

                      ButtonItem('assets/SvgPicture/icons8-facebook.svg','تسجيل الدخول عبر الفيس بوك',
                          30,(){},Color(0xff367fc0),67,SizeOfConfig.widthScreen-60,context),
                      SizedBox(height: getheightScreen(20),),
                      ButtonItem('assets/SvgPicture/google-plus-svgrepo-com.svg','تسجيل الدخول عبر جوجل' ,
                          35, () {},Color(0xffdd4b39),67,SizeOfConfig.widthScreen-60, context),
                      SizedBox(height: getheightScreen(50),),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("ليس لديك حساب؟ ",
                          style: TextStyle(
                            color: Color(0x99183765),
                            fontSize: 15,
                            fontFamily: 'Cairo',
                          ),
                          ),
                          myInlWell("تسجيل الإشتراك", (){

                            pushNavigator(SignUpPage(), context);
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


import 'package:flutter/material.dart';

const primaryColor= Color(0xFF169183);
const backgroundColor= Color(0xFFFFFFFF);
const titlesTexts=TextStyle(
    fontSize: 20,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.bold
);
const secondTextStyle=TextStyle(
  fontSize: 14,
    fontFamily: 'Cairo',
    color: Color(0xFF9D9FA2),
  fontWeight: FontWeight.bold
);

const priceText=TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'Cairo',
    fontSize: 17
);




final RegExp emailValidatorRegExp=
RegExp(r"^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

final RegExp nameValidatorRegExp=
RegExp(r"^[a-zA-Z0]+");

final RegExp phoneNumberValidatorRegExp=
RegExp(r"^[0-9]+");
//_____________________________________________________
const String kEmailNullError = "رجاءً قم بإدخال بريدك الإلكتروني";
const String kNameNullError = "رجاءً قم بإدخال إسمك";
const String kInvalidNameError = "رجاءً قم بإدخال الاسم بشكل صحيح";
const String kPassNullError = "رجاءً قم بإدخال كلمة السر الخاصة بك";
const String kMakeSurePassNullError = "رجاءً قم بإدخال تأكيد كلمة السر الخاصة بك";
const String kPhoneNumberNullError = "رجاءً قم بإدخال رقم هاتفك";
const String kAddressNullError = "رجاءً قم بإدخال العنوان الخاص بك";
const String kInvalidEmailError = "رجاءً قم بإدخال بريد إلكتروني صحيح";
const String kInvalidphoneNumberError = "رجاءً قم بإدخال أرقام فقط";
const String kShortPassError = "كلمة السر قصيرة جدا";
const String kMatchPassError = "كلمة السر غير مطابقة";



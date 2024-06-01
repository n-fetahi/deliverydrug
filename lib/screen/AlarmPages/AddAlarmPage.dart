import 'package:deliverydrug/constant/DefultBotton.dart';
import 'package:deliverydrug/constant/Navigators.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:deliverydrug/screen/AlarmPages/ActivatedAlarmPage.dart';
import 'package:flutter/material.dart';

import '../../constant/MyAppBar.dart';
import '../../constant/MyBottomBar.dart';
import '../../constant/MyFloatingActionButton.dart';
import '../../constant/SizeConfig.dart';


class AddAlarmPage extends StatefulWidget {
  const AddAlarmPage({Key? key}) : super(key: key);

  @override
  State<AddAlarmPage> createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {

  String value='نوع الدواء';
  bool isChange=false;
   double _value=1;
  String weekNumbers='أسبوع';
  double _currentIndex=0;

  List<Map> medicineTypeList=[
    {'name':'إبرة','img':'assets/medicineType/needle.png'},
    {'name':'كبسولات','img':'assets/medicineType/pills.png'},
    {'name':'حبوب','img':'assets/medicineType/medicine.png'},
    {'name':'سائل','img':'assets/medicineType/dropper.png'},
  ];


  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: MyBottomBar(
        index: 3,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: MyFloatingActionButton(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getheightScreen(80)),
        child: MyAppBar(),
      ),
      body: Column(
        children: [
          SizedBox(height: getheightScreen(10),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('أضف تنبيه',
                style: titlesTextStyle(),
                ),
                buildTextsField(item: alarmTextField()),
                buildTextsField(item:
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    width: double.infinity,
                    child: DropdownButton<String>(
                      borderRadius: BorderRadius.circular(20),
                      underline: SizedBox(),
                      hint: Container(
                        padding: EdgeInsets.only(left: 20),
                        width: getWidthScreen(240),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.arrow_drop_down_sharp,size: 30,color: primaryColor,),

                            Text(
                              '$value',
                              style: alarmTextStyle(isChange),
                            ),
                          ],
                        ),
                      ),
                      icon: SizedBox(),


                      items: <String>['UI'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (_) {
                        setState((){
                          isChange=true;
                          value=_.toString();
                        });
                      },
                    ),
                  ),
                ),
                ),
                SizedBox(height: getheightScreen(10),),
                Text('مدة الأستخدام',
                  style: titlesTextStyle(),
                ),
                SizedBox(height: getheightScreen(20),),
                SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      activeTickMarkColor: Colors.white,
                      trackHeight: 15,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0,),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
                    ),
                    child: Slider(
                      min: 1,
                      max: 14,
                      value: _value,
                      divisions: 13,
                      activeColor: primaryColor,
                      inactiveColor: primaryColor.withOpacity(.0),

                      onChanged: (double value) {
                        setState(() {
                          _value = value;
                          switch(_value.toInt()){
                            case 1:weekNumbers='أسبوع';break;
                            case 2:weekNumbers='أسبوعين';break;
                            case 3:weekNumbers='ثلاثة أسابيع';break;
                            case 4:weekNumbers='أربعة أسابيع';break;
                            case 5:weekNumbers='خمسة أسابيع';break;
                            case 6:weekNumbers='ستة أسابيع';break;
                            case 7:weekNumbers='سبعة أسابيع';break;
                            case 8:weekNumbers='ثمانية أسابيع';break;
                            case 9:weekNumbers='تسعة أسابيع';break;
                            case 10:weekNumbers='عشرة أسابيع';break;
                            case 11:weekNumbers='احدى عشر أسبوع';break;
                            case 12:weekNumbers='اثنا عشر أسبوع';break;
                            case 13:weekNumbers='ثلاثة عشر أسبوع';break;
                            case 14:weekNumbers='اربعة عشر أسبوع';break;
                          }
                        });
                      },
                    ),
                  ),

                SizedBox(height: getheightScreen(10),),

                Text('$weekNumbers',
                  style: TextStyle(
                    fontFamily: 'Cairo',

                  ),
                ),
                SizedBox(height: getheightScreen(20),),
                Text('إختر صنف الدواء',
                  style: titlesTextStyle(),
                ),
                Container(
                  padding: EdgeInsets.only(),
                  height: getheightScreen(130),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: medicineTypeList.length,
                      itemBuilder: (context,index)=>InkWell(
                        onTap: (){
                          setState((){
                            _currentIndex=index.toDouble();
                          });
                        },
                        child: Container(
                          width: SizeOfConfig.widthScreen/4-25,
                          margin: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color:_currentIndex==index?Colors.white:Colors.white.withOpacity(.9),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      offset: Offset(0,3),
                                      blurRadius: 7,
                                    )]

                                ),
                                padding: EdgeInsets.all(5),
                                child: Image.asset(medicineTypeList[index]['img'],
                                  height: getheightScreen(60),
                                  width: SizeOfConfig.widthScreen/4+20,

                                ),
                              ),

                              Text(medicineTypeList[index]['name'],
                                style:TextStyle(
                                  fontFamily: 'Cairo',
                                  color: _currentIndex==index?Colors.black: Colors.black45,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                      )

                  ),
                ),


                DefultButton('تم', false, () {
                  pushNavigator(ActivatedAlarmPage(), context);
                }, context)



              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle titlesTextStyle() {
    return TextStyle(
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold
              );
  }
  TextField alarmTextField() {
    return TextField(
      cursorColor: primaryColor,
      style: alarmTextStyle(false),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'إسم الدواء',
        hintStyle: alarmTextStyle(false),
      ),
      onTap: (){},
    );
  }

  TextStyle alarmTextStyle(bool isChange) {
    return TextStyle(
        fontFamily: 'Cairo',
        fontSize: 14,
        color: isChange==true?Colors.black: Colors.black38,
        fontWeight: FontWeight.bold
    );
  }
}
class buildTextsField extends StatelessWidget {
  const buildTextsField({Key? key, required this.item}) : super(key: key);

  final Widget item;

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);

    return Container(
      height: getheightScreen(50),
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0,3),
            blurRadius: 7,
          )]

      ),
      child: item,
    );
  }

}

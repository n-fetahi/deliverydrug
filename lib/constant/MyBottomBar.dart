import 'package:deliverydrug/constant/Navigators.dart';
import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:deliverydrug/screen/AlarmPages/AddAlarmPage.dart';
import 'package:deliverydrug/screen/HomePage.dart';
import 'package:deliverydrug/screen/NotesPage.dart';
import 'package:deliverydrug/screen/PersonalFilePage.dart';
import 'package:deliverydrug/screen/PreviousOrders/PreviousOrderListPage.dart';
import 'package:deliverydrug/screen/SignInPage.dart';

import '../screen/SearchPage.dart';
import 'MyFloatingActionButton.dart';
import 'package:flutter/material.dart';

import '../screen/Cart.dart';


class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key,required this.index,this.isChat=false}) : super(key: key);
  final int index;
  final bool isChat;

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  List<Map> ?_pages;
  int _selectedPageIndex = 0;
  List bottomNavigationBarItems=[
    [
      BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '   الملف الشخصي',
          tooltip: 'الملف الشخصي'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'بحث',
          tooltip: 'بحث'
      ),
      BottomNavigationBarItem(
        activeIcon: null,
        icon: Icon(null),
        label: '',
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.watch_later,),
          label: 'منبه الدواء',
          tooltip: 'منبه الدواء'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_rounded),
          label: 'عربة التسوق',
          tooltip: 'عربة التسوق'
      ),
    ],

    [
      BottomNavigationBarItem(
          icon: Icon(Icons.note_alt),
          label: 'ملاحظات',
          tooltip: 'ملاحظات '
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.pin_drop),
          label: 'الخريطة',
          tooltip: 'الخريطة'
      ),
      BottomNavigationBarItem(
        activeIcon: null,
        icon: Icon(null),
        label: '',
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.message,),
          label: 'الرسائل',
          tooltip: 'الرسائل'
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.checklist),
          label: 'الطلبات',
          tooltip: 'عربة التسوق'
      ),
    ]

  ];

  @override
  void initState() {
    _pages = widget.isChat==false? [
      {
        'page': PersonalFilePage(),
      },
      {
        'page': SearchPage(),
      },
      {
        'page': HomePage(),
      },
      {
        'page': AddAlarmPage(),
      },
      {
        'page': Cart(),
      },
    ]:[
      {
        'page': NotesPage(),
      },
      {
        'page': NotesPage(),
      },
      {
        'page': NotesPage(),
      },
      {
        'page': NotesPage(),
      },
      {
        'page': PreviousOrderListPage(),
      },

    ];
    super.initState();
  }

  void _selectPage(int index) {

      pushNavigator(_pages![index]['page'], context);

  }

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return BottomAppBar(

      shape: CircularNotchedRectangle(),
      notchMargin: 2,
      elevation: 100,
      clipBehavior: Clip.antiAlias,
      child: Container(

        height: getheightScreen(90),
        child: Container(
          decoration: BoxDecoration(

            color:backgroundColor,
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0,
              ),
            ),
          ),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor:  Color(0xFFAFB2B2),
            selectedItemColor: primaryColor,
            unselectedLabelStyle: TextStyle(
                fontSize: 10,
                fontFamily: 'Cairo'
            ),
            selectedLabelStyle: TextStyle(
                fontSize: 14,
                fontFamily: 'Cairo'
            ),

            iconSize: 25,
            currentIndex: widget.index,
            items: widget.isChat==true?bottomNavigationBarItems[1]: bottomNavigationBarItems[0],
          ),
        ),
      ),
    );
  }


}
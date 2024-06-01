import 'package:deliverydrug/constant/MyAppBar.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:flutter/material.dart';

import '../constant/MyBottomBar.dart';
import '../constant/MyFloatingActionButton.dart';
import '../constant/SizeConfig.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: MyBottomBar(
        isChat: true,
        index: 0,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: MyFloatingActionButton(),
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(getheightScreen(80)),
        child: MyAppBar(trailing: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/offering.jpg'),
        )
        ),
      ),
      body:  Container(
        width: SizeOfConfig.widthScreen,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('الملاحظات',
                style: TextStyle(
                  fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                    fontFamily: 'Cairo'
                ),
              ),
              InkWell(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('أضف ملاحظة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cairo',
                     fontSize: 17
                    ),
                    ),
                    Icon(Icons.add_circle_outlined,color: primaryColor,size: 35,),

                  ],
                ),
              )

            ],
          ),
      ),

    );
  }
}

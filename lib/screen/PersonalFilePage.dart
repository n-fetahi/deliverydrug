import 'package:flutter/material.dart';

import '../constant/MyAppBar.dart';
import '../constant/MyBottomBar.dart';
import '../constant/MyFloatingActionButton.dart';
import '../constant/SizeConfig.dart';

class PersonalFilePage extends StatefulWidget {
  const PersonalFilePage({Key? key}) : super(key: key);

  @override
  State<PersonalFilePage> createState() => _PersonalFilePageState();
}

class _PersonalFilePageState extends State<PersonalFilePage> {
  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: MyBottomBar(
        isChat: true,
        index: 2,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: MyFloatingActionButton(),
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(getheightScreen(250)),
        child: MyAppBar(trailing: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/man.png'),
        ),
          name: 'جميل جمال',
          img: 'assets/man.png',
          subTitle: 'www.prsonal@gmail.com',
        ),
      ),
    );
  }
}

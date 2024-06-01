import 'package:deliverydrug/constant/SizeConfig.dart';
import 'package:deliverydrug/constant/constant.dart';
import 'package:flutter/material.dart';

import '../constant/Lists.dart';
import '../constant/MyBottomBar.dart';
import '../constant/MyFloatingActionButton.dart';
import '../constant/SearchText.dart';
import '../constant/buildcategoriesItems.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  final _formKey=GlobalKey<FormState>();
  final searchlControll=TextEditingController();

  @override
  Widget build(BuildContext context) {
    String searchResult = '';
    SizeOfConfig().init(context);
    return Form(
      key: _formKey,
      child: Scaffold(
          bottomNavigationBar: MyBottomBar(
            index: 1,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterDocked,
          floatingActionButton: MyFloatingActionButton(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidthScreen(10)),
                child: Column(
                  children: [

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: SearchText(
                        controller: searchlControll,
                        press: (value) {
                        searchResult = value.toString();
                      },
                      ),
                    ),


                    searchResult != ''
                        ? Center(
                            heightFactor: getheightScreen(3),
                            child: Image.asset(
                              'assets/searchIcon.png',
                              height: getheightScreen(150),
                              width: getWidthScreen(150),
                            ),
                          )
                        :  Container(
                      height: getheightScreen(600),
                      child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 30.0,
                          children: medicineList
                              .map((Map cat) => buildcategoriesItems(
                              cat['img'],
                              cat['name'],
                              cat['price'],
                              cat['disc'],
                              context))
                              .toList()),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

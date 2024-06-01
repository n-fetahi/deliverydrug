import 'package:deliverydrug/constant/TextForm.dart';
import 'package:deliverydrug/screen/AddPrescriptionPage.dart';
import 'package:deliverydrug/screen/SignInPage.dart';
import 'package:flutter/material.dart';

import '../constant/MyBottomBar.dart';

import '../constant/ItemsTemplate.dart';
import '../constant/Lists.dart';
import '../constant/MyAppBar.dart';
import '../constant/MyFloatingActionButton.dart';
import '../constant/MyInkWell.dart';
import '../constant/Navigators.dart';
import '../constant/SearchText.dart';
import '../constant/SizeConfig.dart';
import '../constant/addButton.dart';
import '../constant/buildcategoriesItems.dart';
import '../constant/constant.dart';
import 'BuyItemPage.dart';
import 'ReceiveOfOrdersPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double categoriesNumber = 0;
  List<Map> itemsList = categoriesList;
  final searchlControll=TextEditingController();


  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Scaffold(
      bottomNavigationBar: MyBottomBar(
        index: 2,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: MyFloatingActionButton(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(getheightScreen(170)),
        child: MyAppBar(
          name: 'أحمد السيد',
          img: 'assets/offering.jpg',
          subTitle: 'عميل',
          isHome: true,
          SearchText: SearchText(
            controller: searchlControll,
              press: (value){
            setState((){
              searchlControll;
            });
          }),
          leading: SizedBox(),
          trailing: SizedBox(),
        ),
      ),


      body:SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        addButton("أضف الروشته", Icons.camera_alt_rounded, getWidthScreen(22),
                    getheightScreen(80),SizeOfConfig.widthScreen/4 ,getWidthScreen(12),
                            (){
                          pushNavigator(AddPrescriptionPage(), context);
                            },context),
                        addButton('أكتب طلبــــك', Icons.edit, getWidthScreen(25),
                            getheightScreen(80),SizeOfConfig.widthScreen/4,
                            getWidthScreen(11)
                            ,(){
                              pushNavigator(ReceiveOfOrdersPage(), context);
                            }, context),
                      ],
                    ),
                    SizedBox(
                      height: getheightScreen(20),
                    ),
                    searchlControll.text.length==0?Column(
                      children: [
                        itemsList == categoriesList
                            ? Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'الأقسام',
                                  style: titlesTexts,
                                ),
                                SizedBox(
                                  height: getheightScreen(10),
                                ),
                                Container(
                                  height: getheightScreen(140),
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                switch (index) {
                                                  case 0:
                                                    itemsList = medicineList;
                                                    break;
                                                  case 1:
                                                    itemsList = haircareList;
                                                    break;
                                                  case 2:
                                                    itemsList = skincareList;
                                                    break;
                                                  case 3:
                                                    itemsList = momAndBabyList;
                                                    break;
                                                  case 4:
                                                    itemsList = vitaminsList;
                                                    break;
                                                }
                                              });
                                            },
                                            child: ItemsTemplate(
                                              img: categoriesList[index]['img'],
                                              size: 77,
                                              itemName: categoriesList[index]
                                              ['name'],
                                            ),
                                          ),
                                      separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 35,
                                      ),
                                      itemCount: categoriesList.length),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'العروض',
                                  style: titlesTexts,
                                ),
                                SizedBox(
                                  height: getheightScreen(10),
                                ),
                                MaterialButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Colors.black, width: 1)),
                                  onPressed: () {},
                                  padding: EdgeInsets.zero,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/offering.jpg",
                                        fit: BoxFit.cover,
                                        height: 130,
                                        width: 400,
                                      )),
                                )
                              ],
                            )
                          ],
                        )
                            :Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              child: Icon(Icons.arrow_back_ios_sharp,size: 20,),
                              onTap: (){
                                setState((){
                                  itemsList = categoriesList;
                                });

                              },
                            ),
                            SizedBox(height: getheightScreen(15),),
                            Container(
                              height: getheightScreen(370),
                              child: GridView.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 30.0,
                                  children: itemsList
                                      .map((Map cat) => buildcategoriesItems(
                                      cat['img'],
                                      cat['name'],
                                      cat['price'],
                                      cat['disc'],
                                      context))
                                      .toList()),
                            )
                          ],
                        )
                      ],
                    ):Container(
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
            ],
          ),
      ),

    );
  }


}

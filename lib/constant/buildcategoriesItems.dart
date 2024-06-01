import 'package:flutter/material.dart';

import '../screen/BuyItemPage.dart';
import 'ItemsTemplate.dart';
import 'Navigators.dart';


Widget buildcategoriesItems(String img, String name, double price,
    String disc, BuildContext context) {
  return Container(
    width: 100,
    child: GestureDetector(
      onTap: () {
        pushNavigator(
            BuyItemPage(
              img: img,
              name: name,
              price: price,
              disc: disc,
            ),
            context);
      },
      child: ItemsTemplate(
        img: img,
        size: 110,
        itemName: name,
        price: price,
      ),
    ),
  );
}
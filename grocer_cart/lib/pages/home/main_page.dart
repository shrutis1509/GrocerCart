import 'package:flutter/material.dart';
import 'package:grocer_cart/pages/grocery/popular_grocery_detail.dart';
import 'package:grocer_cart/widgets/bigText.dart';
import 'package:grocer_cart/widgets/smallText.dart';

import '../../utils/dimensions.dart';

import 'groceryPageBody.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
              child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Bihar", color: Colors.brown[900]),
                    Row(
                      children: [
                        SmallText(
                          text: "Patna",
                          color: Colors.brown[500],
                        ),
                        Icon(Icons.arrow_drop_down_circle_rounded)
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search,
                          color: Colors.white, size: Dimensions.iconSize24),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: Colors.brown[500])),
                ),
              ],
            ),
          )),
          //showing the body
          Expanded(child: SingleChildScrollView(
            child: GroceryPageBody(),
          )),
        ],
      ),
    );
  }
}

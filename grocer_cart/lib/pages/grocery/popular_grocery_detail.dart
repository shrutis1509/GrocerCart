// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocer_cart/pages/home/groceryPageBody.dart';
//import 'package:get/get_core/src/get_main.dart';
//import 'package:grocer_cart/utils/dimensions.dart';
import 'package:grocer_cart/widgets/app_column.dart';
import 'package:grocer_cart/widgets/app_icon.dart';

import '../../widgets/bigText.dart';
//import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/smallText.dart';
//import '../home/main_page.dart';

class PopularGroceryDetail extends StatelessWidget {
  const PopularGroceryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image/shopImage1.jpeg"),
                      ),
                    ),
                    child: new Stack(
                      children: <Widget>[
                        new Positioned(
                          top: 20,
                          left: 20,
                          right: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap:(){
                                 Get.to(()=>GroceryPageBody());},
                                  child:
                              AppIcon(icon: Icons.arrow_back_ios)),
                              AppIcon(icon: Icons.shopping_cart_outlined)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  height: 150,
                  width: 700,
                  child: AppColumn(text: "AS Enterprise")
                ),


                //List of items in the shop
                Expanded(
                  //top: Dimensions.popularFoodImgSize-60,
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 10,
                          right: 10,

                        ),
                        child: Row(
                          children: [

                            //Image Section
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.orange.shade50,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/image/rice.jpeg"))),
                            ),

                            //Text Section (Item Detail)
                            Expanded(
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20), bottomRight: Radius.circular(20),
                                  ),
                                  color: Colors.orange.shade50,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10, right: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(text: "Rice/Chawal - Usna"),
                                      SizedBox(height: 5),
                                      SmallText(text: "Price- Rs. 70/kg"),
                                      SizedBox(height: 5)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

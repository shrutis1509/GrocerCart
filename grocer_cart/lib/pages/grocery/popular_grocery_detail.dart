import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocer_cart/utils/dimensions.dart';
import 'package:grocer_cart/widgets/app_icon.dart';

import '../../widgets/bigText.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/smallText.dart';

class PopularGroceryDetail extends StatelessWidget {
  const PopularGroceryDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/image/shopImage1.jpeg"
                  )
                )
              ),
            ),
          ),
          Positioned(
              top: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.popularFoodImgSize-60,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.orange[50]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "AS Enterprise"),
                    SizedBox(height: Dimensions.height20,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5,(index) => const Icon(Icons.star,size: 15,)),
                        ),
                        const SizedBox(width: 20,),
                        SmallText(text: "4.5"),
                        const SizedBox(width: 10,),
                        SmallText(text: "1287"),
                        const SizedBox(width: 4,),
                        SmallText(text: "comments")
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: Colors.orangeAccent,
                          color: Colors.black38,
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.5km",
                          iconColor: Colors.brown,
                          color: Colors.black38,
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "30min",
                          iconColor: Colors.pink,
                          color: Colors.black38,
                        )
                      ],
                    )
                  ],
                ),
          )),
          //List of items in the shop
          Container(
            height: 700,
            //top: Dimensions.popularFoodImgSize-60,
            child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index){
                  return Container(
                    margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.orange.shade50,
                              image: DecorationImage(image: AssetImage("assets/image/rice.jpeg"))
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

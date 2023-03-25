import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';
import 'package:grocer_cart/pages/grocery/popular_grocery_detail.dart';
import 'package:grocer_cart/widgets/app_column.dart';
import 'package:grocer_cart/widgets/bigText.dart';
import 'package:grocer_cart/widgets/icon_and_text_widget.dart';
import 'package:grocer_cart/widgets/smallText.dart';

import '../../utils/dimensions.dart';

class GroceryPageBody extends StatefulWidget {
  const GroceryPageBody({Key? key}) : super(key: key);

  @override
  State<GroceryPageBody> createState() => _GroceryPageBodyState();
}

class _GroceryPageBodyState extends State<GroceryPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(text: "Ranchi", color: Colors.brown[900]),
                    Row(
                      children: [
                        SmallText(
                          text: "Lalpur",
                          color: Colors.brown[500],
                        ),
                        Icon(Icons.arrow_drop_down_circle_rounded)
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(Icons.search,
                          color: Colors.white, size: 24),
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(15),
                          color: Colors.brown[500])),
                ),
              ],
            ),
          ),

          //slider section
          Container(
            //color:Colors.redAccent,
            height: 350,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position) {
                  return _buildPageItem(position);
                }),
          ),
          //dots
          new DotsIndicator(
            dotsCount: 5,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: Colors.brown[500],
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
          //popular text
          SizedBox(height: 30,),
          Container(
            margin: EdgeInsets.only(left: 30, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Shops In Your Area"),
              ],
            ),
          ),

          //list of Shops and images
          Expanded(
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              //physics: NeverScrollableScrollPhysics(),
              //shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20,),
                  child: Row(
                    children: [
                      //image section
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>PopularGroceryDetail());},
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(20),
                              color: Colors.white38,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/image/shopImage1.jpeg"))),
                        ),
                      ),
                      //text container
                      GestureDetector(
                        onTap: (){
                          Get.to(()=>PopularGroceryDetail());},
                        child: Expanded(
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 10,
                                  right: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(text: "AS Enterprises"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SmallText(text: "Good quality product"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: const [
                                      IconAndTextWidget(
                                        icon: Icons.circle_sharp,
                                        text: "Normal",
                                        iconColor: Colors.orangeAccent,
                                        color: Colors.brown,
                                      ),
                                      IconAndTextWidget(
                                        icon: Icons.location_on,
                                        text: "1.7km",
                                        iconColor: Colors.brown,
                                        color: Colors.brown,
                                      ),
                                      IconAndTextWidget(
                                        icon: Icons.access_time_rounded,
                                        text: "32min",
                                        iconColor: Colors.pink,
                                        color: Colors.brown,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      Matrix4.diagonal3Values(1, currScale, 1)
          .setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 250,
            margin: EdgeInsets.only(
                left: 10, right: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: index.isEven
                    ? const Color(0xFFFFCC80)
                    : const Color(0xFFFFCA28),
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/image/rice.jpeg"))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 170,
              margin: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: Container(
                padding: EdgeInsets.only(top: 0, left: 0, right: 0),
                child: AppColumn(text: "AS Enterprise"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

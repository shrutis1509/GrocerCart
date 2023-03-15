import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:grocer_cart/widgets/bigtext.dart';
import 'package:grocer_cart/widgets/icon_and_text_widget.dart';
import 'package:grocer_cart/widgets/smalltext.dart';

import '../utils/dimensions.dart';

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

  @override
  void initstate() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color:Colors.redAccent,
          height: Dimensions.pageView,
          child: PageView.builder(
              controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: Colors.brown[500],
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        )
      ],
    );
  }
  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() -1) {
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
      transform:matrix,
      child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,
              margin:  EdgeInsets.only(left:Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: index.isEven
                      ? const Color(0xFFFFCC80)
                      : const Color(0xFFFFCA28),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("./assets/image/gain.jpg"))),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: Dimensions.pageViewContainer,
                  margin:  EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, bottom: Dimensions.height30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
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
                    padding: EdgeInsets.only(top: Dimensions.height15, left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "Grains"),
                         SizedBox(
                          height: Dimensions.height10,),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => const Icon(
                                        Icons.star,
                                        size: 15,
                                      )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SmallText(text: "4.5"),
                            const SizedBox(
                              width: 10,
                            ),
                            SmallText(text: "1287"),
                            const SizedBox(
                              width: 10,
                            ),
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
                              text: "1.7km",
                              iconColor: Colors.brown,
                              color: Colors.black38,
                            ),
                            IconAndTextWidget(
                              icon: Icons.access_time_rounded,
                              text: "32min",
                              iconColor: Colors.pink,
                              color: Colors.black38,
                            )
                          ],
                        )
                      ],
                    ),
                  )),
            )
          ],
        ),
    );

  }
}

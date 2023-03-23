import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocer_cart/controllers/popular_product_controller.dart';
import 'package:grocer_cart/controllers/recommended_product_controller.dart';
import 'package:grocer_cart/data/repository/recommended_product_repo.dart';
import 'package:grocer_cart/models/products_model.dart';
import 'package:grocer_cart/pages/grocery/popular_grocery_detail.dart';
import 'package:grocer_cart/routes/route_helper.dart';
import 'package:grocer_cart/widgets/app_column.dart';
import 'package:grocer_cart/widgets/bigText.dart';
import 'package:grocer_cart/widgets/icon_and_text_widget.dart';
import 'package:grocer_cart/widgets/smallText.dart';

import '../../utils/app_constants.dart';
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
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController> (builder:(popularProducts){
          return popularProducts.isLoaded? Container(
            //color:Colors.redAccent,
            height: Dimensions.pageView,
            child: GestureDetector(
              onTap: (){
               Get.toNamed(RouteHelper.getPopularGrocery());
              },
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position,popularProducts.popularProductList[position]);
                  }),
            ),
          ):CircularProgressIndicator(
            color: Colors.brown[600],
          );

        }),
        //dots
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return  DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: Colors.brown[500],
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          );
        }),
        //popular text
        SizedBox(height: Dimensions.height45,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Shops In Your Area"),
            ],
          ),
        ),

        //list of Shops and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct){
          return recommendedProduct.isLoaded?Expanded(
          child: ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    //shrinkWrap: true,
    itemCount: 10,
    itemBuilder: (context, index) {
    return Container(
    margin: EdgeInsets.only(
    left: Dimensions.width20,
    right: Dimensions.width20,
    bottom: Dimensions.height10),
    child: Row(
    children: [
    //image section
    Container(
    width: Dimensions.listViewImgSize,
    height: Dimensions.listViewImgSize-30,
    decoration: BoxDecoration(
    borderRadius:
    BorderRadius.circular(Dimensions.radius20),
    color: Colors.white38,
    image: DecorationImage(
    fit: BoxFit.cover,
    image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+recommendedProduct.recommendedProductList[index].img!
    )
    )
    ),
    ),
    //text container
    Expanded(
    child: Container(
    height: Dimensions.listViewTextContSize,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    topRight: Radius.circular(Dimensions.radius20),
    bottomRight: Radius.circular(Dimensions.radius20)),
    color: Colors.white,
    ),
    child: Padding(
    padding: EdgeInsets.only(
    left: Dimensions.width10,
    right: Dimensions.width10),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    BigText(text:recommendedProduct.recommendedProductList[index].name!),
    SizedBox(
    height: Dimensions.height10,
    ),
    SmallText(text: "Good quality product"),
    SizedBox(
    height: Dimensions.height10,
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
    ),
    ],
    ),
    ],
    ),
    ),
    ),
    )
    ],
    ),
    );
    },
    ),
        );
      ],
    );
  }

  Widget _buildPageItem(int index,ProductModel popularProduct) {
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
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven
                    ? const Color(0xFFFFCC80)
                    : const Color(0xFFFFCA28),
                image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URL+popularProduct.img!)
          )
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: Dimensions.pageViewContainer-75,
                margin: EdgeInsets.only(
                    left: Dimensions.width30,
                    right: Dimensions.width30,
                    bottom: Dimensions.height30),
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
                  padding: EdgeInsets.only(top: 10, left: 5, right:15),
                  child: AppColumn(text: popularProduct.name!),
                ),
            ),
          )
        ],
      ),
    );
  }
}

}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocer_cart/widgets/bigtext.dart';
import 'package:grocer_cart/widgets/icon_and_text_widget.dart';
import 'package:grocer_cart/widgets/smalltext.dart';

class GroceryPageBody extends StatefulWidget {
  const GroceryPageBody({Key? key}) : super(key: key);

  @override
  State<GroceryPageBody> createState() => _GroceryPageBodyState();
}

class _GroceryPageBodyState extends State<GroceryPageBody> {
  PageController pageController=PageController( viewportFraction: 0.85);
  var _currPageValue=0.0;
  @override
  void initstate(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;

      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      //color:Colors.redAccent,
      height: 320,
      child:PageView.builder(
        controller: pageController,
          itemCount: 5,
          itemBuilder:(context,position){
            return _buildPageItem(position);
          }),
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale = 1-
    }
    return Stack(
      children: [
        Container(
          height:220,
          margin: const EdgeInsets.only(left:10,right:10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:  index.isEven?const Color(0xFFFFCC80):const Color(0xFFFFCA28),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image:AssetImage(
                      "assets/image/gain.jpg"
                  )
              )

          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height:120,
            margin: const EdgeInsets.only(left:30,right:30,bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:  Colors.white,

            ),
            child: Container(
              padding: const EdgeInsets.only(top:15,left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Soyabean"),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) => const Icon(Icons.star, size: 15,)),
                      ),
                      const SizedBox(width: 10,),
                      SmallText(text:"4.5"),
                      const SizedBox(width: 10,),
                      SmallText(text: "1287"),
                      const SizedBox(width: 10,),
                      SmallText(text: "comments")
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children:   const [
                       IconAndTextWidget(icon: Icons.circle_sharp,
                           text: "Normal",

                           iconColor:Colors.lime, color: Colors.black12,),
                       IconAndTextWidget(icon: Icons.location_on,
                        text: "1.7km",

                        iconColor:Colors.brown, color: Colors.black12,),
                      IconAndTextWidget(icon: Icons.access_time_rounded,
                        text: "32min",

                        iconColor:Colors.pink, color: Colors.black12,)
                    ],
                  )
                ],
              ),
            )
          ),
        )
      ],
    );
  }
}





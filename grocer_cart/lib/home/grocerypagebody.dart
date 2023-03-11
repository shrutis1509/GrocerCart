
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocer_cart/widgets/bigtext.dart';

class GroceryPageBody extends StatefulWidget {
  const GroceryPageBody({Key? key}) : super(key: key);

  @override
  State<GroceryPageBody> createState() => _GroceryPageBodyState();
}

class _GroceryPageBodyState extends State<GroceryPageBody> {
  PageController pageController=PageController( viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {

    return Container(
      color:Colors.redAccent,
      height: 320,
      child:PageView.builder(
        controller: pageController,
          itemCount: 6,
          itemBuilder:(context,position){
            return _buildPageItem(position);
          }),
    );
  }
  Widget _buildPageItem(int index){
    return Stack(
      children: [
        Container(
          height:220,
          margin: EdgeInsets.only(left:6,right:6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color:  index.isEven?Color(0xFFFFCC80):Color(0xFFFFCA28),
              image: DecorationImage(
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
            height:140,
            margin: EdgeInsets.only(left:30,right:30,bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color:  Colors.white,

            ),
            child: Container(
              padding: EdgeInsets.only(top:15,left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Soyabean"),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) => Icon(Icons.star, size: 15,)),

                      )
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



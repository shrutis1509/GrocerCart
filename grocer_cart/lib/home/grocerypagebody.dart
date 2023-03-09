import 'package:flutter/cupertino.dart';

class GroceryPageBody extends StatefulWidget {
  const GroceryPageBody({Key? key}) : super(key: key);

  @override
  State<GroceryPageBody> createState() => _GroceryPageBodyState();
}

class _GroceryPageBodyState extends State<GroceryPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child:PageView.builder(
        itemCount: 6,
        itemBuilder:(context,position){
        return _buildPageItem(position);
    }),

    );
  }
  Widget _buildPageItem(int index){
    return Container(
      height:220,
      margin: EdgeInsets.only(left:6,right:6),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color:  index.isEven?Color(0xFFFFCC80):Color(0xFFFFCA28),
      image: DecorationImage(
        fit: BoxFit.cover,
        image:AssetImage(
          "assets/image/fig1.png"
        )
      )

      ),
    );


  }
}

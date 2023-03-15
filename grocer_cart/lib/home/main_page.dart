import 'package:flutter/material.dart';
import 'package:grocer_cart/widgets/bigtext.dart';
import 'package:grocer_cart/widgets/smalltext.dart';

import './grocerypagebody.dart';

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
          Container(
      child: Container(
        margin: EdgeInsets.only(top: 45,bottom: 15),
        padding: EdgeInsets.only(left: 20,right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                BigText(text: "Bihar", color:Colors.brown),

              SmallText(text: "Patna",color: Colors.black54,)
              ],
            ),
            Container(
              width: 45,
              height: 45,
              child: Icon(Icons.search,color:Colors.white),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.brown[900]
              )
              ),
            
          ],
        ),
      )

    ),
          GroceryPageBody(),
    ],
    ),
    );
  }
}

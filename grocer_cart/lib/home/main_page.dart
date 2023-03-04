import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                Text("state"),
                Text("city")
              ],
            ),
            Container(
              width: 45,
              height: 45,
              child: Icon(Icons.search,color:Colors.white),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.brown[900]

              ),
            )
          ],
        ),
      )

    )
    ],

    )
    );

  }
}

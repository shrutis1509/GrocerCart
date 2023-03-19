import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocer_cart/widgets/smallText.dart';

import '../utils/dimensions.dart';
import 'bigText.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          top: Dimensions.height20),
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(0),
          color: Colors.orange[50]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: text),
          SizedBox(
            height: Dimensions.height20,
          ),
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
                width: 20,
              ),
              SmallText(text: "4.5"),
              const SizedBox(
                width: 10,
              ),
              SmallText(text: "1287"),
              const SizedBox(
                width: 4,
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
    );

  }
}

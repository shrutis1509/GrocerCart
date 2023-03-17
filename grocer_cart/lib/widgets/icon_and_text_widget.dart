import 'package:flutter/cupertino.dart';
import 'package:grocer_cart/widgets/smallText.dart';

import '../utils/dimensions.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color iconColor;
   const IconAndTextWidget({Key? key,
  required this.icon,
  required this.text,

  required this.iconColor, required this.color, }) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor, size:Dimensions.iconSize24),
        SizedBox(width: 4,),
        SmallText(text: text,color: color,),

      ],
    );
  }
}



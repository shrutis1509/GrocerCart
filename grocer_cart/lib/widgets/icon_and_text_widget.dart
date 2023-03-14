import 'package:flutter/cupertino.dart';
import 'package:grocer_cart/widgets/smalltext.dart';

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
        Icon(icon,color: iconColor,),
        SizedBox(width: 5,),
        SmallText(text: text,color: color,),

      ],
    );
  }
}



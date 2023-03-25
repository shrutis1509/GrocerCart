import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText({Key? key,
    this.color = const Color(0xFF5D4037) ,
    required this.text,
    this.size=14,
    this.height=1.2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
        text,
        style: TextStyle(
            fontFamily: 'Roberto',
            color: color,
            fontSize: size,
            height: height,
            fontWeight: FontWeight.w200
        ),
    );
  }
}

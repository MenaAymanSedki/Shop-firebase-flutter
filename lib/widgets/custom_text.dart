
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  double fontSize;
  Color color;
  bool ?FontWeight;
  final dynamic OnPresses;
  final Alignment alignment;
  final double height;
  final int? maxline;

  CustomText({
    this.text = '',
    this.fontSize = 16,
    this.OnPresses,
    this.FontWeight,
    this.maxline,
    this.height=1,
    this.alignment =Alignment.topLeft,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        // maxLines: 1,
        style: TextStyle(
          fontSize: fontSize,
          height: height,
        
          color: color,
        ),
      ),
    );
  }
}

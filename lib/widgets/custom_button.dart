import 'package:flat_3d_button/flat_3d_button.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final dynamic OnPress;
 
  CustomButton({super.key, required this.text, required this.OnPress});

  @override
  Widget build(BuildContext context) {
    return Flat3dButton(
      clickDuration: Duration(milliseconds: 150),
      padding: EdgeInsets.all(5),
      onPressed: OnPress,
      color:Colors.green,
      child: CustomText(
        text: text,
        color: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}

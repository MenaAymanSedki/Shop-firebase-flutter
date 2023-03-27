import 'package:flat_3d_button/flat_3d_button.dart';
import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial({super.key, required this.text, required this.imageName, this.OnPress});
  final String text;
  final String imageName;
  final dynamic OnPress;


  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Row(
              children: [
                Flat3dButton(
                  padding: EdgeInsets.all(15),
                  color:Colors.amber,
                  onPressed: OnPress,
                  child: Row(
                    children: [
                      Image.asset(imageName),
                      SizedBox(width: 100,),
                      CustomText(
                        text: text,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
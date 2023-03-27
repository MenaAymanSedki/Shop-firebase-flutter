import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomFormField extends StatelessWidget {
  
  final String text;
  final String hint;
  final dynamic onSave;
  final dynamic validator;

  const CustomFormField({ required this.text, required this.hint, required this.onSave, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
              children: [
                CustomText(
                  text: text,
                  color: Colors.grey.shade900,
                  fontSize: 14,
                ),
                TextFormField(
                  onSaved:onSave,
                  validator: validator,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ],
            ),
    );
  }
}
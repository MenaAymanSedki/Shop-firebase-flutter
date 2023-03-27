import 'package:app_commerce/widgets/custom_from-field.dart';
import 'package:app_commerce/widgets/custom_text.dart';
import 'package:app_commerce/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              CustomText(
                text: 'Billing address is the same as delivery address',
                fontSize: 14,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                  text: 'Street 1', hint: '21, Alex Davidson Avenue'),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                  text: 'Street 2', hint: 'Opposite Omegatron, Vicent Quarters'),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(text: 'City', hint: 'Victoria Island'),
              SizedBox(height: 40,),
              Container(
                width: Get.width,
                child: Row(children: [
                 Expanded(child: CustomTextFormField(hint: 'Lagos State',text:'State' ,)),
                 SizedBox(width: 30,),
                 Expanded(child: CustomTextFormField(hint:'Nigeria' ,text: 'Country',))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

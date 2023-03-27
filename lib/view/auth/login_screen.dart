import 'package:app_commerce/constants.dart';
import 'package:app_commerce/core/view_model/auth_view_model.dart';
import 'package:app_commerce/view/auth/register_screen.dart';
import 'package:app_commerce/widgets/custom_text.dart';
import 'package:flat_3d_button/flat_3d_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Welcome,', fontSize: 30),
                  GestureDetector(
                      onTap: () {
                        Get.to(RegisterScreen());
                      },
                      child: CustomText(
                          text: 'Sign Up', color: primColor, fontSize: 18)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                color: Colors.grey,
                fontSize: 14,
                text: 'Sign in to Continue',
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
              CustomFormField(
                text: 'Email',
                hint: 'iamdavid@gmail.com',
                onSave: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print('ERORR');
                  }
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomFormField(
                text: 'Password',
                hint: '********',
                onSave: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null) {
                    print('ERORR');
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: 'Forgot Password?',
                alignment: Alignment.bottomRight,
                fontSize: 14,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                OnPress: () {
                  _formkey.currentState!.save();
                  if (_formkey.currentState!.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
                },
                text: 'SIGN IN',
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                text: '-OR-',
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 40,
              ),
              Flat3dButton(
                onPressed: () {},
                padding: EdgeInsets.all(13),
                color: Colors.amber,
                child: Row(
                  children: [
                    Image.asset('assets/images/Icon_Facebook.png'),
                    SizedBox(
                      width: 100,
                    ),
                    CustomText(
                      text: 'Sign In with Facebook',
                      alignment: Alignment.center,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Flat3dButton(
                onPressed: () {},
                padding: EdgeInsets.all(13),
                color: Colors.amber,
                child: Row(
                  children: [
                    Image.asset('assets/images/icon_google.png'),
                    SizedBox(
                      width: 100,
                    ),
                    CustomButton(
                      OnPress: () {
                        controller.googleSignInMethod();
                      },
                      text: 'Sign In with Google',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

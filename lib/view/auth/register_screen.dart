import 'package:app_commerce/core/view_model/auth_view_model.dart';
import 'package:app_commerce/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_form_field.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  RegisterScreen({super.key});

 final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: GestureDetector(onTap: (){Get.off(LoginScreen());}, child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: 'Sign Up', color: Colors.black, fontSize: 20),
                ],
              ),
                          SizedBox(
                height: 30,
              ),
              CustomFormField(
                text: 'name',
                hint: 'mena Ayman',
                onSave: (value) {
                 controller.name = value;
                },
                validator: (value) {
                  if(value==null){
                    print('ERORR');
                  }
                },
              ),
              CustomFormField(
                text: 'Email',
                hint: 'iamdavid@gmail.com',
                onSave: (value) {
                 controller.email = value;
                },
                validator: (value) {
                  if(value==null){
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
                  if(value == null){
                    print('ERORR');
                  }
                },
              ), 
              SizedBox(
                height: 20,
              ),
              CustomButton(
                OnPress: () {
                  _formkey.currentState!.save();
                  if(_formkey.currentState!.validate()){
                    controller.createAccountWithEmailAndPassword();
                  }
                  
                },
                text: 'SIGN Up',
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
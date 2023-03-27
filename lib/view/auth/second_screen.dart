import 'package:app_commerce/core/view_model/auth_view_model.dart';
import 'package:app_commerce/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: GetBuilder<AuthViewModel>(
            init: AuthViewModel(),
            builder: (value) => Text('${value.counter}'),
          )),
          GetBuilder<AuthViewModel>(
              builder: (value) => Center(
                    child: CustomButton(
                        text: 'increment',
                        OnPress: () {
                          value.Incremment();
                        }),
                  )),
        ],
      ),
    );
  }
}

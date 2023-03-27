import 'package:app_commerce/constants.dart';
import 'package:app_commerce/view/payment_controller.dart';
import 'package:app_commerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentController = Get.put(PaymentController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                paymentController.makePayment(amount: '5', currency: 'USD');
              },
              child: Text('Payment'),
            ),
          ),
          SizedBox(height: 50,),
          CustomText(
            color: primColor,
            alignment: Alignment.center,
              text: 'Please Click Button process payment',
          ),
        ],
      ),
    );
  }
}

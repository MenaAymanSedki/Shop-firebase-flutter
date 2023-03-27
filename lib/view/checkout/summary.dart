import 'package:app_commerce/constants.dart';
import 'package:app_commerce/core/view_model/cart_view_model.dart';
import 'package:app_commerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              height: 350,
              padding: EdgeInsets.all(20),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  child: Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 180,
                          child: Image.network(
                              controller.cartProductModel[index].image,
                              fit: BoxFit.contain),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            text: controller.cartProductModel[index].name,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          color: primColor,
                          fontSize: 13,
                          text:
                              '\$${controller.cartProductModel[index].price.toString()}',
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: controller.cartProductModel.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

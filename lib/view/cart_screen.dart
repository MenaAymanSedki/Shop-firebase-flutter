import 'package:app_commerce/constants.dart';
import 'package:app_commerce/core/view_model/cart_view_model.dart';
import 'package:app_commerce/widgets/custom_button.dart';
import 'package:app_commerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'checkout/checkoutview.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
              init: CartViewModel(),
              builder: (controller) => controller.cartProductModel.length == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/cart_empty.svg',
                          width: 250,
                          height: 250,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomText(
                          text: 'Cart Empty',
                          fontSize: 32,
                          alignment: Alignment.center,
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                          child: ListView.separated(
                        itemBuilder: (contect, index) {
                          return Container(
                            height: 140,
                            child: Row(children: [
                              Container(
                                width: 140,
                                child: Image.network(
                                  controller.cartProductModel[index].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      fontSize: 11,
                                      text: controller
                                          .cartProductModel[index].name,
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    CustomText(
                                      color: primColor,
                                      text:
                                          '\$ ${controller.cartProductModel[index].price.toString()}',
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Container(
                                      width: 140,
                                      height: 40,
                                      color: Colors.grey.shade200,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            CustomText(
                                              alignment: Alignment.center,
                                              text: '1',
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 20),
                                              child: Icon(
                                                Icons.minimize,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          );
                        },
                        itemCount: controller.cartProductModel.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 16,
                          );
                        },
                      )),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: 'TOTAL',
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                      text: '\$ 4500',
                      color: primColor,
                      fontSize: 18,
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(20),
                    width: 180,
                    height: 100,
                    child: CustomButton(text: 'CHECKOUT', OnPress: () {
                      Get.to(HorizontalExample());
                    })),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

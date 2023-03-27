import 'package:app_commerce/constants.dart';
import 'package:app_commerce/core/view_model/cart_view_model.dart';
import 'package:app_commerce/model/cart_product_model.dart';
import 'package:app_commerce/model/products_model.dart';
import 'package:app_commerce/widgets/custom_button.dart';
import 'package:app_commerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  late ProductModel model;
  DetailsScreen({required this.model});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Image.network(
                  model.image,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    CustomText(
                      text: model.name,
                      fontSize: 26,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: 'Size',
                              ),
                              CustomText(
                                text: 'XL',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width * .44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomText(
                                text: 'Color',
                              ),
                              Container(
                                width: 22,
                                height: 22,
                                decoration: BoxDecoration(
                                  color: model.color,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: 'Details',
                      fontSize: 18,
                      FontWeight: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: model.description,
                      height: 1.5,
                      fontSize: 14,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CustomText(
                                text: 'PRICE',
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                fontSize: 18,
                                text: '\$' + model.price,
                                color: primColor,
                              ),
                            ],
                          ),
                          GetBuilder<CartViewModel>(
                            init: CartViewModel(),
                            builder: (controller) => Container(
                                width: 146,
                                height: 50,
                                child: CustomButton(
                                    text: 'ADD',
                                    OnPress:() =>  controller.addProduct(
                                      CartProductModel(
                                          name: model.name,
                                          image: model.image,
                                          price: model.price,
                                          quantity: 1,
                                          productId:model.productId ,
                                          ),
                                    ))),
                          ),
                        ],
                      ),
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

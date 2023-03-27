import 'package:app_commerce/constants.dart';
import 'package:app_commerce/model/home_view_model.dart';
import 'package:app_commerce/view/details_screen.dart';
import 'package:app_commerce/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  FirebaseAuth _auth = FirebaseAuth.instance;

  final List<String> names = [
    'men',
    '#',
    '#',
    '#',
    '#',
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewmodel>(
      init: HomeViewmodel(),
      builder: (controller) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 100,
              right: 20,
              left: 20,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomText(
                  text: 'Categories',
                  fontSize: 18,
                  alignment: Alignment.bottomLeft,
                ),
                SizedBox(
                  height: 30,
                ),
                GetBuilder<HomeViewmodel>(
                  builder: (controller) => Container(
                    child: SizedBox(
                      height: 100,
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.categoryModel.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey.shade100,
                                ),
                                height: 60,
                                width: 60,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                      controller.categoryModel[index].image),
                                ),
                              ),
                              CustomText(
                                text: controller.categoryModel[index].name,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                          width: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Best Selling',
                      fontSize: 18,
                      FontWeight: true,
                    ),
                    CustomText(
                      text: 'See all',
                      fontSize: 14,
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                _listViewProducts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewmodel>(
      builder: (controller) => Container(
        height: 600,
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsScreen(model: controller.productModel[index]));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width *.4,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade100,
                          ),
                          child: Image.network(
                              controller.productModel[index].image),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          alignment: Alignment.bottomLeft,
                          text: controller.productModel[index].name,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: 100,
                          height: 120,
                          child: CustomText(
                            alignment: Alignment.bottomLeft,
                            text: controller.productModel[index].description,
                            fontSize: 16,
                            
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        CustomText(
                          alignment: Alignment.bottomLeft,
                          text: controller.productModel[index].price.toString(),
                          color: primColor,
                          fontSize: 16,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}

import 'package:app_commerce/core/services/home_service.dart';
import 'package:app_commerce/model/category_model.dart';
import 'package:app_commerce/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewmodel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];

  HomeViewmodel() {
    getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel?.fromJson(value[i].data() as Map));
        update();
      }
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel?.fromJson(value[i].data() as Map));
        update();
      }
    });
  }
}

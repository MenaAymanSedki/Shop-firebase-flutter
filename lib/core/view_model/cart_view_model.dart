import 'package:app_commerce/core/services/database/cart_database_helper.dart';
import 'package:app_commerce/model/cart_product_model.dart';
import 'package:app_commerce/model/cart_product_model.dart';
import 'package:get/get.dart';

import '../../model/cart_product_model.dart';

class CartViewModel extends GetxController {
  List<CartProductModel> _cartProductModel = [];
  List<CartProductModel> get cartProductModel => _cartProductModel;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    var dbHelper = CartDatabaseHelper.db;
    _cartProductModel = await dbHelper.getAllProduct();
    print(_cartProductModel.length);
    update();
  }

  Future<dynamic> addProduct(CartProductModel cartProductModel) async {
    if (_cartProductModel.length == 0) {
      var dbHelper = CartDatabaseHelper.db;
      await dbHelper.insert(cartProductModel);
    } else {
      for (int i = 0; i < _cartProductModel.length; i++) {
        if (_cartProductModel[i].productId == cartProductModel.productId) {
          return;
        } else {
          var dbHelper = CartDatabaseHelper.db;
          await dbHelper.insert(cartProductModel);
          update();
        }
      }
    }
  }
  getTotalPrice(){
    
  }
}

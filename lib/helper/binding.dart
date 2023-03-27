import 'package:app_commerce/core/view_model/auth_view_model.dart';
import 'package:app_commerce/core/view_model/cart_view_model.dart';
import 'package:app_commerce/core/view_model/checkout_view_model.dart';
import 'package:app_commerce/core/view_model/control_view_model.dart';
import 'package:app_commerce/helper/local_storage_data.dart';
import 'package:app_commerce/model/home_view_model.dart';
import 'package:app_commerce/view/payment_controller.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewmodel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => CheckOutViweModel());
    Get.lazyPut(() => PaymentController());


  }
}

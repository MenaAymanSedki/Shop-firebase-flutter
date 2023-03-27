import 'package:app_commerce/view/checkout/constance.dart';
import 'package:app_commerce/view/contorll_view.dart';
import 'package:app_commerce/view/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CheckOutViweModel extends GetxController {
  int get index => _index;
  int _index = 0;

  Pages get pages => _pages;
  Pages _pages = Pages.deliveryTime;

  void changeIndex(int i) {
    _index = i;
    if (_index == 1) {
      _pages = Pages.addAddress;
    }else if(_index==2){
      _pages = Pages.summary;
    }else if(_index==3){
        Get.to( () => PaymentScreen()); 
    }
    update();
  }

  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.teal;
    } else {
      return todoColor;
    }
  }
}

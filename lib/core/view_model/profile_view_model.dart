import 'package:app_commerce/helper/local_storage_data.dart';
import 'package:app_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/user_model.dart';

class ProfileViewModel extends GetxController{

  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  UserModel get userModel => _userModel;
  late UserModel _userModel;
  final LocalStorageData localStorageData = Get.find();

  Future<void> signOut() async {
    GoogleSignIn().signOut();

    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
  
  void getCurrentUser() async{
      await localStorageData.getUser.then((value) {
        _userModel = value!;
      });
      _loading.value= false;
      update();
  }
}
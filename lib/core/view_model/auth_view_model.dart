
import 'package:app_commerce/core/services/firestore_user.dart';
import 'package:app_commerce/helper/local_storage_data.dart';
import 'package:app_commerce/model/user_model.dart';
import 'package:app_commerce/view/contorll_view.dart';
import 'package:app_commerce/view/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;

 

  user()=> _user.value?.email;


   String ?email;  
   String ?password;
   String ?name;    

  int counter = 0;

  final  Rx _user = Rx(dynamic);

  final LocalStorageData localStorageData = Get.find();
  // final Rx _firebaseUser = Rx(dynamic);

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if(_auth.currentUser != null){
      getCurrentUserData(_auth.currentUser!.uid);

    }
  }

  @override
  void onReady() { 
    //TODO
    super.onReady();
  }

  @override
  void onClose() {
    //TODO
    super.onClose();
  }

  void Incremment() {
    counter++;
    update();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credintal = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
        Get.offAll(()=>ControlView());
      });

      Get.offAll(HomeScreen());
    } catch (e) {
      print(e);
      Get.snackbar('Error Login account', '${e}',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  // void facebookSigninMethod() async {
  //   FacebookLoginResult result = await _facebookLogin.login(['email']);
  //   final accessToken = result.accessToken!.token;

  //   if (result.status == FacebookLoginStatus.success) {
  //     final faceCredential = FacebookAuthProvider.credential(accessToken);

  // await _auth.signInWithCredential(faceCredential);
  //    }
  // }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email!, password: password!).then((value)async {
          getCurrentUserData(value.user!.uid);
      });
      Get.offAll(() => ControlView());
    } catch (e) {
      print(e);
      Get.snackbar('Error Login account', '${e}',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(()=> ControlView());
    } catch (e) {
      print(e);
      Get.snackbar('Error Login account', '${e}',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user?.uid,
      email: user.user?.email!.toString(),
      name: name ?? user.user!.displayName,
      pic: '',
    );
    await FireStroeUser().addUserToFireStore(userModel);
    setUser(userModel);
  }
  void setUser(UserModel userModel)async {
    await localStorageData.SetUser(userModel);
  }
  void getCurrentUserData(String uid)async {
    await FireStroeUser().getCurrentUser(uid).then((value) {
          setUser(UserModel.fromJson(value.data() as Map));
        });
  }

  
}

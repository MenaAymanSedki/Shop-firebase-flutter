import 'package:app_commerce/core/view_model/profile_view_model.dart';
import 'package:app_commerce/view/auth/login_screen.dart';
import 'package:app_commerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                padding: EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Colors.red,
                                  ),
                                ),
                                Column(
                                  children: [
                                    CustomText(
                                      text: controller.userModel.name!,
                                      color: Colors.black,
                                      fontSize: 32,
                                    ),
                                    CustomText(
                                      text: controller.userModel.email!,
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Edit Profile',
                            ),
                            leading: Image.asset(
                                'assets/images/Icon_Edit-Profile.png'),
                            trailing: Icon(
                              Icons.navigate_next_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Shipping Address',
                            ),
                            leading:
                                Image.asset('assets/images/Icon_Location.png'),
                            trailing: Icon(
                              Icons.navigate_next_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Order History',
                            ),
                            leading:
                                Image.asset('assets/images/Icon_History.png'),
                            trailing: Icon(
                              Icons.navigate_next_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Cards',
                            ),
                            leading:
                                Image.asset('assets/images/Icon_Payment.png'),
                            trailing: Icon(
                              Icons.navigate_next_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Notifications',
                            ),
                            leading:
                                Image.asset('assets/images/Icon_Alert.png'),
                            trailing: Icon(
                              Icons.navigate_next_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: MaterialButton(
                          onPressed: () {},
                          child: ListTile(
                            title: CustomText(
                              text: 'Log Out',
                            ),
                            leading: Image.asset('assets/images/Icon_Exit.png'),
                            trailing: Icon(
                              Icons.navigate_next_rounded,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

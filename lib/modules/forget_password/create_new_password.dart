import 'package:flutter/material.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CreateNewPasswordScreen extends StatelessWidget {
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: defaultColor,
        appBar: AppBar(
          backgroundColor: defaultColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 20.h),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 60.0)],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40.0)),
                    ),
                    width: double.infinity,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, bottom: 30),
                            child: Form(
                                key: formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'Create new password',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'set the ne password for your account so  ',
                                            style: TextStyle(fontSize: 12.sp),
                                          ),
                                          Text(
                                            'you can login and access all the features.  ',
                                            style: TextStyle(fontSize: 12.sp),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        defaultFormField(
                                          context,
                                          hint: 'New Password',
                                          controller: passwordController,
                                          type: TextInputType.visiblePassword,
                                          validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return "Please Enter Your Password";
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        defaultFormField(
                                          context,
                                          hint: 'Confirm New Password',
                                          controller: confirmPasswordController,
                                          type: TextInputType.visiblePassword,
                                          validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return "Please Enter your passowrd again";
                                            } else if (value !=
                                                passwordController.text) {
                                              return "password not match";
                                            }
                                            return null;
                                          },
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.h),
                                      child: defaultButton(
                                          function: () {},
                                          text: 'Save',
                                          isUpperCase: true),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 0.1.h),
              child: SizedBox(
                height: 28.h,
                child: Center(
                  child: Row(
                    children: const [
                      Expanded(
                        child: Image(
                          image: AssetImage(
                              'icons/undraw_authentication_fsn5.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

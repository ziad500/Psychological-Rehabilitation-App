import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:phsyo/modules/forget_password/verify_code.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable, camel_case_types
class forgetPassword extends StatelessWidget {
  var emailForgetController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  forgetPassword({Key? key}) : super(key: key);

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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'Forget Password',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24.sp),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              'Enter Your email to send a recovery code',
                                              style: TextStyle(fontSize: 12.sp),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        defaultFormField(context,
                                            hint: 'Email',
                                            controller: emailForgetController,
                                            type: TextInputType.emailAddress,
                                            validate: (String? value) {
                                          final bool isValid =
                                              EmailValidator.validate(value!);

                                          if (isValid == false ||
                                              value.isEmpty) {
                                            return "Please Enter valid Email";
                                          }
                                          return null;
                                        }, prefix: Icons.email),
                                        SizedBox(
                                          height: 4.h,
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.h),
                                      child: defaultButton(
                                          function: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              navigateTo(
                                                  context, VerifyCodeScreen());
                                            }
                                          },
                                          text: 'Send',
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
                height: 25.h,
                child: Center(
                  child: Row(
                    children: const [
                      Expanded(
                        child: Image(
                          image: AssetImage(
                              'icons/undraw_forgot_password_re_hxwm.png'),
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

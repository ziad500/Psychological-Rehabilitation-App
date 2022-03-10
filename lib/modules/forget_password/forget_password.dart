import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:phsyo/modules/forget_password/verify_code.dart';
import 'package:phsyo/modules/login_screen/login_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class forgetPassword extends StatelessWidget {
  var emailForgetController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: defaultColor,
        appBar: AppBar(
          backgroundColor: defaultColor,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                navigateTo(context, LoginScreen());
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxHeight >= 600.0) {
              return BigScreen(context);
            } else {
              return SmallScreen(context);
            }
          },
        ));
  }

  Widget BigScreen(context) => ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 20.h),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 60.0)],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40.0)),
                    ),
                    height: 75.h,
                    width: double.infinity,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Form(
                                    key: formKey,
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Center(
                                            child: Text(
                                              'Forget Password',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    'Enter Your email to send a recovery code',
                                                    style: TextStyle(
                                                        fontSize: 12.sp),
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
                                                  controller:
                                                      emailForgetController,
                                                  type: TextInputType
                                                      .emailAddress,
                                                  validate: (String? value) {
                                                final bool isValid =
                                                    EmailValidator.validate(
                                                        value!);

                                                if (isValid == false ||
                                                    value.isEmpty) {
                                                  return "Please Enter valid Email";
                                                }
                                              }, prefix: Icons.email),
                                              SizedBox(
                                                height: 4.h,
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.h),
                                            child: defaultButton(
                                                function: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    navigateTo(context,
                                                        VerifyCodeScreen());
                                                    print('Send Success');
                                                  }
                                                },
                                                text: 'Send',
                                                isUpperCase: true),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                      children: [
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
          ),
        ],
      );

  Widget SmallScreen(context) => ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 20.h),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 60.0)],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40.0)),
                    ),
                    height: 75.h,
                    width: double.infinity,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Form(
                                    key: formKey,
                                    child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Center(
                                            child: Text(
                                              'Forget Password',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    'Enter Your email to send a recovery code',
                                                    style: TextStyle(
                                                        fontSize: 11.5.sp),
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
                                                  hintsize: 10.0,
                                                  verticalpadding: 10.0,
                                                  controller:
                                                      emailForgetController,
                                                  type: TextInputType
                                                      .emailAddress,
                                                  validate: (String? value) {
                                                final bool isValid =
                                                    EmailValidator.validate(
                                                        value!);

                                                if (isValid == false ||
                                                    value.isEmpty) {
                                                  return "Please Enter valid Email";
                                                }
                                              }, prefix: Icons.email),
                                              SizedBox(
                                                height: 4.h,
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.h),
                                            child: defaultButton(
                                                verticalpadding: 10.0,
                                                textsize: 10.0,
                                                function: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    navigateTo(context,
                                                        VerifyCodeScreen());

                                                    print('Send Success');
                                                  }
                                                },
                                                text: 'Send',
                                                isUpperCase: true),
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                      children: [
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
          ),
        ],
      );
}

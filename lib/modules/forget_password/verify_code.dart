import 'package:flutter/material.dart';
import 'package:phsyo/modules/forget_password/create_new_password.dart';
import 'package:phsyo/modules/forget_password/forget_password.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class VerifyCodeScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var code1controller = TextEditingController();
  var code2controller = TextEditingController();
  var code3controller = TextEditingController();
  var code4controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: defaultColor,
        appBar: AppBar(
          backgroundColor: defaultColor,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                navigateAndFinish(context, forgetPassword());
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
                  Container(height: 20.h, color: defaultColor),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 60.0)],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(40.0)),
                    ),
                    height: 67.h,
                    width: double.infinity,
                    child: Padding(
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
                                          'Verify Your Email',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24.sp),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Please enter the 4 digit code sent ',
                                            style: TextStyle(fontSize: 12.sp),
                                          ),
                                          Text(
                                            'To email@email.com ',
                                            style: TextStyle(fontSize: 12.sp),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 60.0,
                                            child: CodeFormField(
                                              context,
                                              verticalpadding: 20.0,
                                              controller: code1controller,
                                              type: TextInputType.number,
                                              validate: (String? value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter Your Email";
                                                }
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.h,
                                          ),
                                          Container(
                                            width: 60.0,
                                            child: CodeFormField(
                                              context,
                                              verticalpadding: 20.0,
                                              controller: code2controller,
                                              type: TextInputType.number,
                                              validate: (String? value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter Your Email";
                                                }
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.h,
                                          ),
                                          Container(
                                            width: 60.0,
                                            child: CodeFormField(
                                              context,
                                              verticalpadding: 20.0,
                                              controller: code3controller,
                                              type: TextInputType.number,
                                              validate: (String? value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter Your Email";
                                                }
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.h,
                                          ),
                                          Container(
                                            width: 60.0,
                                            child: CodeFormField(
                                              context,
                                              verticalpadding: 20.0,
                                              controller: code4controller,
                                              type: TextInputType.number,
                                              validate: (String? value) {
                                                if (value!.isEmpty) {
                                                  return "Please Enter Your Email";
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.h),
                                        child: defaultButton(
                                            function: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                navigateTo(context,
                                                    createNewPasswordScreen());
                                                print('Send Success');
                                              }
                                            },
                                            text: 'Verify',
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
                                'icons/undraw_mobile_inbox_re_ciwq.png'),
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
                  Container(height: 20.h, color: defaultColor),
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
                                              'Verify Your Email',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Please enter the 4 digit code sent ',
                                                style: TextStyle(
                                                    fontSize: 11.5.sp),
                                              ),
                                              Text(
                                                'To email@email.com ',
                                                style:
                                                    TextStyle(fontSize: 12.sp),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 60.0,
                                                child: CodeFormField(
                                                  context,
                                                  verticalpadding: 15.0,
                                                  controller: code1controller,
                                                  type: TextInputType.number,
                                                  validate: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return "Please Enter Your Email";
                                                    }
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.h,
                                              ),
                                              Container(
                                                width: 60.0,
                                                child: CodeFormField(
                                                  context,
                                                  verticalpadding: 15.0,
                                                  controller: code2controller,
                                                  type: TextInputType.number,
                                                  validate: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return "Please Enter Your Email";
                                                    }
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.h,
                                              ),
                                              Container(
                                                width: 60.0,
                                                child: CodeFormField(
                                                  context,
                                                  verticalpadding: 15.0,
                                                  controller: code3controller,
                                                  type: TextInputType.number,
                                                  validate: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return "Please Enter Your Email";
                                                    }
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.h,
                                              ),
                                              Container(
                                                width: 60.0,
                                                child: CodeFormField(
                                                  context,
                                                  verticalpadding: 15.0,
                                                  controller: code4controller,
                                                  type: TextInputType.number,
                                                  validate: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return "Please Enter Your Email";
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 4.h,
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
                                                        createNewPasswordScreen());
                                                    print('Send Success');
                                                  }
                                                },
                                                text: 'Verify',
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
                                'icons/undraw_mobile_inbox_re_ciwq.png'),
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

import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phsyo/layout/layout.dart';
import 'package:phsyo/modules/forget_password/create_new_password.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register3.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class doctorRegister3 extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var code1controller = TextEditingController();
  var code2controller = TextEditingController();
  var code3controller = TextEditingController();
  var code4controller = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var firstName = CasheHelper.getData(key: 'firstNameDoctor');
  var lastName = CasheHelper.getData(key: 'lastNameDoctor');
  var Phone = CasheHelper.getData(key: 'PhoneDoctor');
  var Email = CasheHelper.getData(key: 'EmailDoctor');
  var Password = CasheHelper.getData(key: 'PasswordDoctor');
  var date = CasheHelper.getData(key: 'dateDoctor');
  var LicIssuedDate = CasheHelper.getData(key: 'LicIssuedDateDoctor');
  var LicExpiryDate = CasheHelper.getData(key: 'LicExpiryDateDoctor');
  var profileImage = CasheHelper.getData(key: 'profileImageDoctor');
  var licenseImage = CasheHelper.getData(key: 'licenseImageDoctor');
  var Gender = CasheHelper.getData(key: 'GenderDoctor');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: defaultColor,
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: defaultColor,
          elevation: 0.0,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxHeight >= 600) {
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
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            'Verify Your Email',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24.sp),
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
                                              'Please enter the 4 digit code sent ',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                              ),
                                            ),
                                            Text(
                                              'To ${Email} ',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
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
                                                showModalBottomSheet(
                                                  barrierColor:
                                                      Colors.transparent,
                                                  isDismissible: false,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  context: context,
                                                  builder: (context) =>
                                                      bottomSheet(context),
                                                );
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
                                                'To ${Email} ',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                                    showModalBottomSheet(
                                                      barrierColor:
                                                          Colors.transparent,
                                                      isDismissible: false,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(40.0),
                                                      ),
                                                      context: context,
                                                      builder: (context) =>
                                                          bottomSheet(context),
                                                    );
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

  Widget bottomSheet(context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: DottedBorder(
          dashPattern: [10, 5, 10, 5, 10, 5],
          radius: Radius.circular(40.0),
          borderType: BorderType.RRect,
          color: Colors.red,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
            ),
            height: 350.0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('icons/undraw_completed_re_cisp.png'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Registration Done',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  Text(
                    'Successfully',
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: defaultColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      function: () {
                        navigateAndFinish(context, Applayout());
                      },
                      text: 'Start Your Journey')
                ],
              ),
            ),
          ),
        ),
      );

  /*  Center(
                child: defaultButton(
                    function: () {
                      showModalBottomSheet(
                        barrierColor: Colors.transparent,
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        context: context,
                        builder: (context) => bottomSheet(),
                      );
                    },
                    text: 'continue')), */

}

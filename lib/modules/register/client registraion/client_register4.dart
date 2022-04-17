import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/layout.dart';
import 'package:phsyo/modules/forget_password/create_new_password.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register3.dart';
import 'package:phsyo/modules/register/register_cubit/register_cubit.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class clientRegister4 extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var code1controller = TextEditingController();
  var code2controller = TextEditingController();
  var code3controller = TextEditingController();
  var code4controller = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var firstNameClient = CasheHelper.getData(key: 'firstNameClient');
  var lastNameClient = CasheHelper.getData(key: 'lastNameClient');
  var phoneClient = CasheHelper.getData(key: 'PhoneClient');
  var emailClient = CasheHelper.getData(key: 'EmailClient');
  var passwordClient = CasheHelper.getData(key: 'PasswordClient');
  var genderClient = CasheHelper.getData(key: 'GenderClient');
  var date = CasheHelper.getData(key: 'date');
  var mopileEmergency = CasheHelper.getData(key: 'MopileEmergency');
  var contactRelation = CasheHelper.getData(key: 'contactRelation');
  var mediacalHistory = CasheHelper.getData(key: 'mediacalHistory');
  var services = CasheHelper.getData(key: 'Services');
  var image = CasheHelper.getData(key: 'image');

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is AppRegisterSuccessState) {
          showModalBottomSheet(
            barrierColor: Colors.transparent,
            isDismissible: false,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            context: context,
            builder: (context) => bottomSheet(context),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: defaultColor,
            key: scaffoldKey,
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: defaultColor,
              elevation: 0.0,
            ),
            body: BigScreen(context, state));
      },
    );
  }

  Widget BigScreen(context, state) => Stack(
        children: [
          Column(
            children: [
              Container(height: 20.h, color: defaultColor),
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
                      padding: const EdgeInsets.only(top: 60),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0, bottom: 30.0),
                          child: Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Verify Your Email',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
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
                                        const Text(
                                          'Please enter the 4 digit code sent ',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        Text(
                                          'To $emailClient ',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
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
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
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
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
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
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 3.h),
                                      child: ConditionalBuilder(
                                        condition:
                                            state is AppRegisterLoadingState,
                                        builder: (context) => const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        fallback: (context) => defaultButton(
                                            function: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                RegisterCubit.get(context)
                                                    .signUp(
                                                        firstName:
                                                            firstNameClient,
                                                        lastName:
                                                            lastNameClient,
                                                        email: emailClient,
                                                        password:
                                                            passwordClient,
                                                        mobilePhone:
                                                            phoneClient,
                                                        gender: genderClient,
                                                        birthDate: date,
                                                        trustContact:
                                                            mopileEmergency,
                                                        contactRelation:
                                                            contactRelation,
                                                        medicalHistory:
                                                            mediacalHistory,
                                                        sessions: services);
                                              }
                                            },
                                            text: 'Verify',
                                            isUpperCase: true),
                                      )),
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
                        image:
                            AssetImage('icons/undraw_mobile_inbox_re_ciwq.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                                                'To $emailClient ',
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
                                                    RegisterCubit.get(context)
                                                        .signUp(
                                                            firstName:
                                                                firstNameClient,
                                                            lastName:
                                                                lastNameClient,
                                                            email: emailClient,
                                                            password:
                                                                passwordClient,
                                                            mobilePhone:
                                                                phoneClient,
                                                            gender:
                                                                genderClient,
                                                            birthDate: date,
                                                            trustContact:
                                                                mopileEmergency,
                                                            contactRelation:
                                                                contactRelation,
                                                            medicalHistory:
                                                                mediacalHistory,
                                                            sessions: services);
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

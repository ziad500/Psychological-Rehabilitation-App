import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/layout.dart';

import 'package:phsyo/modules/register/register_cubit/register_cubit.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class clientRegister4 extends StatelessWidget {
  final String firstName;
  final String lastName;
  var mobileNumber;
  final String Gender;
  final String email;
  final String password;
  final String date;
  var MobileEmergency;
  final String contactRelation;
  final String mediacalHistory;
  var services;
  clientRegister4(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.Gender,
      required this.email,
      required this.password,
      required this.date,
      required this.MobileEmergency,
      required this.contactRelation,
      required this.mediacalHistory,
      required this.services})
      : super(key: key);

  var formKey = GlobalKey<FormState>();
  var code1controller = TextEditingController();
  var code2controller = TextEditingController();
  var code3controller = TextEditingController();
  var code4controller = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is AppErrorVerifyState) {
          showToast(text: 'Code is Wrong', state: ToastStates.error);
        }
        if (state is AppSuccessVerifyState) {
          RegisterCubit.get(context).clientSignUp(
              firstName: firstName,
              lastName: lastName,
              email: email,
              password: password,
              mobilePhone: mobileNumber,
              gender: Gender,
              birthDate: date,
              trustContact: MobileEmergency,
              contactRelation: contactRelation,
              medicalHistory: mediacalHistory,
              sessions: ['services']);
        }
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
            body: Stack(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
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
                                                'To $email',
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                            Expanded(
                                              child: codeFormField(
                                                context,
                                                verticalpadding: 20.0,
                                                controller: code1controller,
                                                type: TextInputType.number,
                                                validate: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return "Please Enter Your Email";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: codeFormField(
                                                context,
                                                verticalpadding: 20.0,
                                                controller: code2controller,
                                                type: TextInputType.number,
                                                validate: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return "Please Enter Your Email";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: codeFormField(
                                                context,
                                                verticalpadding: 20.0,
                                                controller: code3controller,
                                                type: TextInputType.number,
                                                validate: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return "Please Enter Your Email";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: codeFormField(
                                                context,
                                                verticalpadding: 20.0,
                                                controller: code4controller,
                                                type: TextInputType.number,
                                                validate: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return "Please Enter Your Email";
                                                  }
                                                  return null;
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
                                            child: ConditionalBuilder(
                                              condition: state
                                                  is AppRegisterLoadingState,
                                              builder: (context) =>
                                                  const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                              fallback: (context) => state
                                                      is AppLoadingVerifyState
                                                  ? const Center(
                                                      child:
                                                          CircularProgressIndicator())
                                                  : defaultButton(
                                                      function: () {
                                                        if (formKey
                                                            .currentState!
                                                            .validate()) {
                                                          RegisterCubit.get(context).verifyEmail(
                                                              email,
                                                              code1controller
                                                                      .text +
                                                                  code2controller
                                                                      .text +
                                                                  code3controller
                                                                      .text +
                                                                  code4controller
                                                                      .text);
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
            ));
      },
    );
  }

  Widget bottomSheet(context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: DottedBorder(
          dashPattern: const [10, 5, 10, 5, 10, 5],
          radius: const Radius.circular(40.0),
          borderType: BorderType.RRect,
          color: Colors.red,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(40.0)),
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
                        navigateAndFinish(context, const Applayout());
                      },
                      text: 'Start Your Journey')
                ],
              ),
            ),
          ),
        ),
      );
}

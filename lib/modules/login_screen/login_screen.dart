import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/layout/layout.dart';
import 'package:phsyo/modules/forget_password/forget_password.dart';
import 'package:phsyo/modules/login_screen/login_cubit.dart';
import 'package:phsyo/modules/login_screen/login_states.dart';
import 'package:phsyo/modules/register/register_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/constraints.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../shared/network/cashe_helper.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is AppLoginSuccessState) {
          if (state.loginModel.status == true) {
            /*             CasheHelper.saveData(key: 'token', value: state.loginModel.token);
     */
            navigateAndFinish(context, Applayout());
            showToast(
                text: state.loginModel.message.toString(),
                state: ToastStates.SUCCESS);
          } else if (State is AppLoginErrorState) {
            navigateTo(context, Applayout());
            showToast(text: "error", state: ToastStates.ERROR);
          }
          {}
        }
      },
      builder: (context, state) {
        return Scaffold(
            /*  appBar: AppBar(
              elevation: 0.0,
              backgroundColor: defaultColor,
            ),
         */
            backgroundColor: defaultColor,
            //appBar: appbar,
            body: BigScreen(context, state));
      },
    );
  }

  Widget BigScreen(context, state) => SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 22.h),
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
                        padding: const EdgeInsets.only(top: 40),
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
                                    Center(
                                      child: Text(
                                        'Welcome',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 35),
                                      ),
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Login to view and manage your sessions.',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    defaultFormField(context,
                                        hint: 'Email',
                                        controller: emailController,
                                        type: TextInputType.emailAddress,
                                        validate: (String? value) {
                                      final bool isValid =
                                          EmailValidator.validate(value!);

                                      if (isValid == false || value.isEmpty) {
                                        return "Please Enter valid Email";
                                      }
                                    }, prefix: Icons.email),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    defaultFormField(context,
                                        hint: 'Password',
                                        isPassword:
                                            LoginCubit.get(context).isVisible,
                                        controller: passwordController,
                                        type: TextInputType.visiblePassword,
                                        onSubmit: (value) {
                                          if (formKey.currentState!
                                              .validate()) {}
                                        },
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Your Password";
                                          }
                                        },
                                        prefix: Icons.lock_outline,
                                        suffix: LoginCubit.get(context).suffix,
                                        suffixPressed: () {
                                          LoginCubit.get(context)
                                              .passwordvisible();
                                        }),
                                    Row(
                                      children: [
                                        Expanded(
                                            child:
                                                buildRadioBig('User', context)),
                                        Expanded(
                                            child: buildRadioBig(
                                                'Doctor', context)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              navigateTo(
                                                  context, forgetPassword());
                                            },
                                            child: const FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                'Forget your Password !',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: defaultColor),
                                              ),
                                            )),
                                      ],
                                    ),
                                    ConditionalBuilder(
                                      condition: state is! AppLoginLoadingState,
                                      builder: (context) => Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.h),
                                            child: defaultButton(
                                                function: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    if (LoginCubit.get(context)
                                                            .radiovalue ==
                                                        'User') {
                                                      LoginCubit.get(context)
                                                          .userLogin(
                                                              email:
                                                                  emailController
                                                                      .text,
                                                              password:
                                                                  passwordController
                                                                      .text);
                                                    } else if (LoginCubit.get(
                                                                context)
                                                            .radiovalue ==
                                                        'Doctor') {
                                                      LoginCubit.get(context)
                                                          .doctorLogin(
                                                              email:
                                                                  emailController
                                                                      .text,
                                                              password:
                                                                  passwordController
                                                                      .text);
                                                    }

                                                    /* 
                                          else if (LoginCubit
                                                        .get(
                                                            context)
                                                    .radiovalue ==
                                                'User') {
                                              LoginCubit.get(
                                                      context)
                                                  .userLogin(
                                                      email:
                                                          emailController
                                                              .text,
                                                      password:
                                                          passwordController
                                                              .text);
                                            } else if (LoginCubit
                                                        .get(
                                                            context)
                                                    .radiovalue ==
                                                '') {
                                              showToast(
                                                  text:
                                                      'Choose Type To Login',
                                                  state: ToastStates
                                                      .WARNING);
                                            } */
                                                  }
                                                },
                                                text: 'login',
                                                isUpperCase: true),
                                          ),
                                        ],
                                      ),
                                      fallback: (context) => const Center(
                                          child: CircularProgressIndicator()),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            'Don\'t have an account? ',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                navigateTo(context,
                                                    const RegisterScreen());
                                              },
                                              child: const Text(
                                                'Register',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: defaultColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
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
              padding: EdgeInsetsDirectional.only(top: 6.h),
              child: SizedBox(
                height: 18.h,
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Image(
                          image: AssetImage('icons/login.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget SmallScreen(context, state) => SingleChildScrollView(
          child: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 25.h),
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
                                          height: 1.h,
                                        ),
                                        Center(
                                          child: Text(
                                            'Welcome',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 17.sp),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  'Login to view and manage your sessions.',
                                                  style: TextStyle(
                                                      fontSize: 12.sp),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        defaultFormField(context,
                                            hintsize: 10.0,
                                            verticalpadding: 10.0,
                                            hint: 'Email',
                                            controller: emailController,
                                            type: TextInputType.emailAddress,
                                            validate: (String? value) {
                                          final bool isValid =
                                              EmailValidator.validate(value!);

                                          if (isValid == false ||
                                              value.isEmpty) {
                                            return "Please Enter valid Email";
                                          }
                                        }, prefix: Icons.email),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        defaultFormField(context,
                                            hintsize: 10.0,
                                            hint: 'Password',
                                            verticalpadding: 10.0,
                                            isPassword: LoginCubit.get(context)
                                                .isVisible,
                                            controller: passwordController,
                                            type: TextInputType.visiblePassword,
                                            onSubmit: (value) {
                                              if (formKey.currentState!
                                                  .validate()) {}
                                            },
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter Your Password";
                                              }
                                            },
                                            prefix: Icons.lock_outline,
                                            suffix:
                                                LoginCubit.get(context).suffix,
                                            suffixPressed: () {
                                              LoginCubit.get(context)
                                                  .passwordvisible();
                                            }),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: buildRadioSmall(
                                                    'User', context)),
                                            Expanded(
                                                child: buildRadioSmall(
                                                    'Doctor', context)),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  navigateTo(context,
                                                      forgetPassword());
                                                },
                                                child: Text(
                                                  'Forget your Password !',
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: defaultColor),
                                                )),
                                          ],
                                        ),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.h),
                                            child: ConditionalBuilder(
                                              condition: state
                                                  is! AppLoginLoadingState,
                                              builder: (context) =>
                                                  defaultButton(
                                                      verticalpadding: 10.0,
                                                      textsize: 10.0,
                                                      function: () {
                                                        if (formKey
                                                            .currentState!
                                                            .validate()) {
                                                          if (LoginCubit.get(
                                                                      context)
                                                                  .radiovalue ==
                                                              'Doctor') {
                                                            print('hi Doctor');
                                                          } else if (LoginCubit
                                                                      .get(
                                                                          context)
                                                                  .radiovalue ==
                                                              'User') {
                                                            LoginCubit.get(
                                                                    context)
                                                                .userLogin(
                                                                    email:
                                                                        emailController
                                                                            .text,
                                                                    password:
                                                                        passwordController
                                                                            .text);
                                                            showToast(
                                                                text: 'success',
                                                                state: ToastStates
                                                                    .SUCCESS);
                                                            print('Hi User');
                                                          } else if (LoginCubit
                                                                      .get(
                                                                          context)
                                                                  .radiovalue ==
                                                              '') {
                                                            showToast(
                                                                text:
                                                                    'Choose Type To Login',
                                                                state: ToastStates
                                                                    .WARNING);
                                                          }
                                                        }
                                                      },
                                                      text: 'login',
                                                      isUpperCase: true),
                                              fallback: (context) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            )),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Don\'t have an account? ',
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  navigateTo(context,
                                                      const RegisterScreen());
                                                },
                                                child: Text(
                                                  'Register',
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: defaultColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))
                                          ],
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
              padding: EdgeInsetsDirectional.only(top: 10.h),
              child: SizedBox(
                height: 15.h,
                child: Center(
                  child: Row(
                    children: const [
                      Expanded(
                        child: Image(
                          image: AssetImage('icons/login.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ));

  Widget buildRadioBig(String value, context) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: LoginCubit.get(context).radiovalue,
            onChanged: (value) {
              LoginCubit.get(context).changeRadio(value);
            }),
        Text(
          value,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }

  Widget buildRadioSmall(String value, context) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: LoginCubit.get(context).radiovalue,
            onChanged: (value) {
              LoginCubit.get(context).changeRadio(value);
            }),
        Text(
          '$value',
          style: TextStyle(fontSize: 10.sp),
        )
      ],
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/modules/register/doctor%20registration/doctor_register2.dart';
import 'package:phsyo/modules/register/register_screen.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:sizer/sizer.dart';

import 'package:phsyo/modules/register/register_cubit/register_cubit.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';

class doctorRegister1 extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var BusinessMobileNumberController = TextEditingController();
  var EmailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var radioValue = 0;

  void passData(context) {
    CasheHelper.saveData(
        key: 'firstNameDoctor', value: firstNameController.text);
    CasheHelper.saveData(key: 'lastNameDoctor', value: lastNameController.text);
    CasheHelper.saveData(
        key: 'PhoneDoctor', value: BusinessMobileNumberController.text);
    CasheHelper.saveData(key: 'EmailDoctor', value: EmailController.text);
    CasheHelper.saveData(key: 'PasswordDoctor', value: passwordController.text);
    CasheHelper.saveData(
        key: 'GenderDoctor', value: RegisterCubit.get(context).radiovalue);
  }

  doctorRegister1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                centerTitle: true,
                title: const Text(
                  'Doctor Sign Up',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              body: bigScreen(context));
        },
      ),
    );
  }

  Widget bigScreen(context) => Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Joining our family to participate in',
                          style:
                              TextStyle(color: Colors.grey, fontSize: 15.0.sp),
                        ),
                        Text(
                          'making people mental health better.',
                          style:
                              TextStyle(color: Colors.grey, fontSize: 15.0.sp),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultFormField(
                          context,
                          hint: 'first name',
                          controller: firstNameController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your first name";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      Expanded(
                        child: defaultFormField(
                          context,
                          hint: 'last name',
                          controller: lastNameController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your last name";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  defaultFormField(
                    context,
                    hint: 'Business Mobile Number',
                    controller: BusinessMobileNumberController,
                    type: TextInputType.number,
                    validate: (value) {
                      if (value!.length != 11) {
                        return "please enter avalid number ";
                      }
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Color(0xffE8E8EE),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 5),
                            child: Text(
                              'Select Gender',
                              style: TextStyle(
                                fontSize: 15.0.sp,
                                color: Colors.grey.shade800,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(child: buildRadioBig('male', context)),
                              Expanded(child: buildRadioBig('Female', context)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  defaultFormField(
                    context,
                    hint: 'Email Address',
                    controller: EmailController,
                    type: TextInputType.emailAddress,
                    validate: (String? value) {
                      final bool isValid = EmailValidator.validate(value!);

                      if (isValid == false || value.isEmpty) {
                        return "Please Enter valid Email";
                      }
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  defaultFormField(
                    context,
                    hint: 'Password',
                    isPassword: RegisterCubit.get(context).passwordvisible,
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    suffix: RegisterCubit.get(context).suffixpasswordvisible,
                    suffixPressed: () {
                      RegisterCubit.get(context).changepasswordvisible();
                    },
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Password";
                      }
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  defaultFormField(
                    context,
                    hint: 'Confirm Password',
                    isPassword:
                        RegisterCubit.get(context).passwordConfirmVisible,
                    controller: confirmPasswordController,
                    type: TextInputType.visiblePassword,
                    suffix:
                        RegisterCubit.get(context).suffixpasswordConfirmVisible,
                    suffixPressed: () {
                      RegisterCubit.get(context).changePasswordConfirmVisible();
                    },
                    onSubmit: (value) {
                      if (formKey.currentState!.validate()) {}
                    },
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return "Please Enter your passowrd again";
                      } else if (value != passwordController.text) {
                        return "password not match";
                      }
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.h),
                    child: defaultButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            passData(context);
                            navigateTo(context, doctorRegister2());
                          }
                        },
                        text: 'Continue',
                        isUpperCase: true),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Learn about'),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Privacy',
                            style: TextStyle(color: defaultColor),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget smallScreen(context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.h),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Joining our family to participate in',
                        style: TextStyle(color: Colors.grey, fontSize: 12.0.sp),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        ' making people mental health better.',
                        style: TextStyle(color: Colors.grey, fontSize: 12.0.sp),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: defaultFormField(
                        context,
                        hintsize: 10.0,
                        verticalpadding: 10.0,
                        hint: 'first name',
                        controller: firstNameController,
                        type: TextInputType.text,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your first name";
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      width: 1.h,
                    ),
                    Expanded(
                      child: defaultFormField(
                        context,
                        hintsize: 10.0,
                        verticalpadding: 10.0,
                        hint: 'last name',
                        controller: lastNameController,
                        type: TextInputType.text,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your last name";
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                defaultFormField(
                  context,
                  hintsize: 10.0,
                  verticalpadding: 10.0,
                  hint: 'Business Mobile Number',
                  controller: BusinessMobileNumberController,
                  type: TextInputType.number,
                  validate: (value) {
                    if (value!.length != 11) {
                      return "please enter avalid number ";
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Color(0xffE8E8EE),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                          child: Text(
                            'Select Gender',
                            style: TextStyle(
                              fontSize: 12.0.sp,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(child: buildRadioSmall('male', context)),
                            Expanded(child: buildRadioSmall('Female', context)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                defaultFormField(context,
                    hintsize: 10.0,
                    verticalpadding: 10.0,
                    hint: 'Email Address',
                    controller: EmailController,
                    type: TextInputType.text, validate: (String? value) {
                  final bool isValid = EmailValidator.validate(value!);

                  if (isValid == false || value.isEmpty) {
                    return "Please Enter valid Email";
                  }
                }),
                SizedBox(
                  height: 2.h,
                ),
                defaultFormField(
                  context,
                  hintsize: 10.0,
                  verticalpadding: 10.0,
                  hint: 'Password',
                  isPassword: RegisterCubit.get(context).passwordvisible,
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  suffix: RegisterCubit.get(context).suffixpasswordvisible,
                  suffixPressed: () {
                    RegisterCubit.get(context).changepasswordvisible();
                  },
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Password";
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                defaultFormField(
                  context,
                  hintsize: 10.0,
                  verticalpadding: 10.0,
                  hint: 'Confirm Password',
                  isPassword: RegisterCubit.get(context).passwordConfirmVisible,
                  controller: confirmPasswordController,
                  type: TextInputType.visiblePassword,
                  suffix:
                      RegisterCubit.get(context).suffixpasswordConfirmVisible,
                  suffixPressed: () {
                    RegisterCubit.get(context).changePasswordConfirmVisible();
                  },
                  onSubmit: (value) {
                    if (formKey.currentState!.validate()) {}
                  },
                  validate: (String? value) {
                    if (value!.isEmpty) {
                      return "Please Enter your passowrd again";
                    } else if (value != passwordController.text) {
                      return "password not match";
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.h),
                  child: defaultButton(
                      verticalpadding: 10.0,
                      textsize: 10.0,
                      function: () {
                        if (formKey.currentState!.validate()) {
                          passData(context);
                          print('login Success');
                          navigateTo(context, doctorRegister2());
                        }
                      },
                      text: 'Continue',
                      isUpperCase: true),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Learn about'),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Privacy',
                          style: TextStyle(color: defaultColor),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildRadioBig(String value, context) {
    return Row(
      children: [
        Radio(
            value: value,
            activeColor: defaultColor,
            groupValue: RegisterCubit.get(context).radiovalue,
            onChanged: (value) {
              RegisterCubit.get(context).changeRadio(value);
            }),
        Text(
          '$value',
          style: TextStyle(fontSize: 12.sp),
        )
      ],
    );
  }

  Widget buildRadioSmall(String value, context) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: RegisterCubit.get(context).radiovalue,
            onChanged: (value) {
              RegisterCubit.get(context).changeRadio(value);
            }),
        Text(
          '$value',
          style: TextStyle(fontSize: 10.sp),
        )
      ],
    );
  }
}

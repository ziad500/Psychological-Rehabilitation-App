import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/models/model.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register2.dart';
import 'package:phsyo/modules/register/register_screen.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:sizer/sizer.dart';
import 'package:phsyo/modules/login_screen/login_cubit.dart';
import 'package:phsyo/modules/login_screen/login_states.dart';
import 'package:phsyo/modules/register/register_cubit/register_cubit.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/constraints.dart';
import 'package:phsyo/styles/colors.dart';

class clientRegister1 extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mopileNumberController = TextEditingController();
  var EmailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var radioValue = 0;

  void passData(context) {
    CasheHelper.saveData(
        key: 'User name',
        value: firstNameController.text + '' + lastNameController.text);
    CasheHelper.saveData(key: 'Phone', value: mopileNumberController.text);
    CasheHelper.saveData(key: 'Email', value: EmailController.text);
    CasheHelper.saveData(key: 'Password', value: passwordController.text);
    CasheHelper.saveData(
        key: 'Confirm Password', value: confirmPasswordController.text);
    CasheHelper.saveData(
        key: 'Gender', value: RegisterCubit.get(context).radiovalue);
  }

  clientRegister1({Key? key}) : super(key: key);

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
                leading: IconButton(
                    onPressed: () {
                      navigateTo(context, RegisterScreen());
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
                centerTitle: true,
                title: const Text(
                  'Client Sign Up',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              body: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxHeight >= 600.0) {
                    return bigScreen(context);
                  } else {
                    return smallScreen(context);
                  }
                  ;
                },
              ));
        },
      ),
    );
  }

  Widget bigScreen(context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.h),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'improve your mental health by joining our family ',
                        style: TextStyle(color: Colors.grey, fontSize: 15.0.sp),
                      ),
                    ),
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
                  hint: 'Mobile Number',
                  controller: mopileNumberController,
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
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
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
                      function: () {
                        //print(RegisterCubit.get(context).radiovalue);
                        if (formKey.currentState!.validate()) {
                          passData(context);
                          print('login Success');
                          navigateTo(context, clientRegister2());
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

  Widget smallScreen(context) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.h),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'improve your mental health by joining our family',
                        style: TextStyle(color: Colors.grey, fontSize: 12.0.sp),
                      ),
                    ),
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
                  hint: 'Mobile Number',
                  controller: mopileNumberController,
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
                          navigateTo(context, clientRegister2());
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

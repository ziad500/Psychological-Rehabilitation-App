import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register2.dart';
import 'package:sizer/sizer.dart';
import 'package:phsyo/modules/register/register_cubit/register_cubit.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';

// ignore: must_be_immutable
class ClientRegister1 extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mopileNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  var radioValue = 0;

  ClientRegister1({Key? key}) : super(key: key);

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
                  'Client Sign Up',
                  style: TextStyle(color: Colors.black),
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 18, right: 18, bottom: 18),
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
                                  'improve your mental health by',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 3.h),
                                ),
                                Text(
                                  'joining our family .',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 3.h),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
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
                                      /* showToast(
                                  text: "Please Enter Your first name",
                                  state: ToastStates.ERROR); */
                                    }
                                    return null;
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
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1.5.h,
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
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Container(
                            width: double.infinity,
                            height: 85,
                            decoration: const BoxDecoration(
                              color: Color(0xffE8E8EE),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 15, top: 5),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Select Gender',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child:
                                              buildRadioBig('male', context)),
                                      Expanded(
                                          child:
                                              buildRadioBig('Female', context)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          defaultFormField(
                            context,
                            hint: 'Email Address',
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              final bool isValid =
                                  EmailValidator.validate(value!);

                              if (isValid == false || value.isEmpty) {
                                return "Please Enter valid Email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          defaultFormField(
                            context,
                            hint: 'Password',
                            isPassword:
                                RegisterCubit.get(context).passwordvisible,
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            suffix: RegisterCubit.get(context)
                                .suffixpasswordvisible,
                            suffixPressed: () {
                              RegisterCubit.get(context)
                                  .changepasswordvisible();
                            },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Password";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          defaultFormField(
                            context,
                            hint: 'Confirm Password',
                            isPassword: RegisterCubit.get(context)
                                .passwordConfirmVisible,
                            controller: confirmPasswordController,
                            type: TextInputType.visiblePassword,
                            suffix: RegisterCubit.get(context)
                                .suffixpasswordConfirmVisible,
                            suffixPressed: () {
                              RegisterCubit.get(context)
                                  .changePasswordConfirmVisible();
                            },
                            onSubmit: (value) {
                              if (formKey.currentState!.validate()) {}
                              return null;
                            },
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return "Please Enter your passowrd again";
                              } else if (value != passwordController.text) {
                                return "password not match";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.h),
                            child: defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    navigateTo(
                                        context,
                                        ClientRegister2(
                                          email:
                                              emailController.text.toString(),
                                          firstName: firstNameController.text
                                              .toString(),
                                          lastName: lastNameController.text
                                              .toString(),
                                          gender: RegisterCubit.get(context)
                                              .radiovalue
                                              .toString(),
                                          mobileNumber:
                                              mopileNumberController.text,
                                          password: passwordController.text
                                              .toString(),
                                        ));
                                  } else {
                                    showToast(
                                        text: 'please enter data',
                                        state: ToastStates.error);
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
                              const Text('Learn about'),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
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
              ));
        },
      ),
    );
  }

  Widget buildRadioBig(String value, context) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: RegisterCubit.get(context).radiovalue,
            onChanged: (value) {
              RegisterCubit.get(context).changeRadio(value);
            }),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: TextStyle(fontSize: 2.h),
          ),
        )
      ],
    );
  }
}

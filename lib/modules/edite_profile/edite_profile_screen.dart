import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/constants.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/modules/login_screen/login_cubit.dart';
import 'package:phsyo/modules/login_screen/login_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class EditeProfileScreen extends StatelessWidget {
/*   var nameController = TextEditingController();
  var trustContactController = TextEditingController();
  var trustContactRelationController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var mediacalHistoryController = TextEditingController();
  var professionController = TextEditingController();
  var professionlanguagesController = TextEditingController(); */

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        var model = LoginCubit.get(context).profileModel?.user;
        cubit.nameController.text = 'Name : ${model?.name}';
        cubit.trustContactController.text =
            'Trust Contact Phone : ${model?.trustContact}';
        cubit.trustContactRelationController.text =
            'Relation : ${model?.contactRelation}';
        cubit.emailController.text = 'Email : ${model?.email}';
        cubit.phoneController.text = 'Phone : ${model?.mobilePhone}';
        cubit.mediacalHistoryController.text =
            'Medical History : ${model?.medicalHistory}';
        cubit.professionController.text = 'Profession : ${model?.profession}';
        cubit.professionlanguagesController.text =
            'Proficient Languages : ${model?.languages}';
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            title: const Text(
              'Profile',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          body: cubit.profileModel == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 18, right: 18, bottom: 0),
                      child: Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 40.0,
                              backgroundImage: model?.image == null
                                  ? Image.asset('icons/icons8-man-232.png')
                                      .image
                                  : Image.network(
                                      '${model?.image}',
                                      fit: BoxFit.fill,
                                    ).image,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          defaultFormField(context,
                              controller: cubit.nameController,
                              hint: 'user Name',
                              type: TextInputType.text,
                              height: 8, validate: (String? value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your Name";
                            }
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(context,
                              controller: cubit.emailController,
                              hint: 'Email',
                              height: 8,
                              type: TextInputType.text,
                              validate: (String? value) {
                            final bool isValid =
                                EmailValidator.validate(value!);

                            if (isValid == false || value.isEmpty) {
                              return "Please Enter valid Email";
                            }
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultFormField(context,
                              controller: cubit.phoneController,
                              height: 8,
                              hint: 'phone Number',
                              type: TextInputType.text,
                              validate: (String? value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your phone Number";
                            }
                          }),
                          const SizedBox(
                            height: 15,
                          ),
                          doctor == true
                              ? defaultFormField(context,
                                  controller: cubit.professionController,
                                  type: TextInputType.text,
                                  validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Your Profession";
                                  }
                                })
                              : Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: defaultFormField(context,
                                          controller:
                                              cubit.trustContactController,
                                          hint: 'Trust Contact',
                                          type: TextInputType.text,
                                          height: 8, validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter Your Trust Contact";
                                        }
                                      }),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: defaultFormField(context,
                                          controller: cubit
                                              .trustContactRelationController,
                                          hint: 'Relation',
                                          height: 8,
                                          type: TextInputType.text,
                                          validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter Your Trust Contact Relation";
                                        }
                                      }),
                                    ),
                                  ],
                                ),
                          const SizedBox(
                            height: 15,
                          ),
                          doctor == true
                              ? defaultFormField(context,
                                  controller:
                                      cubit.professionlanguagesController,
                                  type: TextInputType.text,
                                  validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Your Profession Languages";
                                  }
                                })
                              : defaultFormField(
                                  context,
                                  hint: 'Medical History',
                                  maxlines: 4,
                                  height: 13,
                                  controller: cubit.mediacalHistoryController,
                                  type: TextInputType.text,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return "Medical History must not be empty";
                                    }
                                  },
                                ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: defaultButton(
                                    function: () {},
                                    text: 'Change Password',
                                    borderColor: defaultColor,
                                    color: Colors.white,
                                    textColor: defaultColor,
                                    isUpperCase: false),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: defaultButton(
                                      function: () {},
                                      text: 'Save',
                                      isUpperCase: false))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

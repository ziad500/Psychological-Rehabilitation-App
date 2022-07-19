import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/constants.dart';

import 'package:phsyo/modules/login_screen/login_cubit.dart';
import 'package:phsyo/modules/login_screen/login_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../layout/cubit/app_cubit.dart';

class EditeProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        var model = LoginCubit.get(context).profileModel?.user;
        cubit.nameController.text = '${model?.name}';
        cubit.trustContactController.text = '${model?.trustContact}';
        cubit.trustContactRelationController.text = '${model?.contactRelation}';
        cubit.emailController.text = '${model?.email}';
        cubit.phoneController.text = '${model?.mobilePhone}';
        cubit.mediacalHistoryController.text = '${model?.medicalHistory}';
        cubit.professionController.text = cubit.professionValue == ''
            ? '${model?.profession}'
            : cubit.professionValue;
        cubit.professionlanguagesController.text =
            '${model?.languages.join(',')}';
        return Scaffold(
            backgroundColor: defaultColor,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    cubit.professionValue = '';
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
              centerTitle: true,
              backgroundColor: defaultColor,
              elevation: 0.0,
              title: const Text(
                'Profile',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            body: cubit.profileModel == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 11.h),
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [BoxShadow(blurRadius: 60.0)],
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(40.0)),
                              ),
                              width: double.infinity,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 30, bottom: 30),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          defaultFormField(context,
                                              controller: cubit.nameController,
                                              label: 'user Name',
                                              type: TextInputType.text,
                                              height: 8,
                                              validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return "Please Enter Your Name";
                                            }
                                            return null;
                                          }),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          defaultFormField(context,
                                              controller: cubit.emailController,
                                              label: 'Email',
                                              height: 8,
                                              type: TextInputType.text,
                                              validate: (String? value) {
                                            final bool isValid =
                                                EmailValidator.validate(value!);

                                            if (isValid == false ||
                                                value.isEmpty) {
                                              return "Please Enter valid Email";
                                            }
                                            return null;
                                          }),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          defaultFormField(context,
                                              controller: cubit.phoneController,
                                              height: 8,
                                              label: 'phone Number',
                                              type: TextInputType.text,
                                              validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return "Please Enter Your phone Number";
                                            }
                                            return null;
                                          }),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          doctor == true
                                              ? defaultFormField(context,
                                                  controller: cubit
                                                      .professionController,
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                Container(
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: Color(
                                                                        0xffE8E8EE),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20.0)),
                                                                  ),
                                                                  child: Column(
                                                                    children: [
                                                                      buildRadioBig(
                                                                          'Therapy',
                                                                          context),
                                                                      buildRadioBig(
                                                                          'Yoga',
                                                                          context),
                                                                      buildRadioBig(
                                                                          'Life Coach',
                                                                          context),
                                                                      buildRadioBig(
                                                                          'Nutrition',
                                                                          context),
                                                                    ],
                                                                  ),
                                                                ));
                                                  },
                                                  label: 'Profession',
                                                  type: TextInputType.text,
                                                  validate: (String? value) {
                                                    if (value!.isEmpty) {
                                                      return "Please Enter Your Profession";
                                                    }
                                                    return null;
                                                  })
                                              : Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: defaultFormField(
                                                          context,
                                                          controller: cubit
                                                              .trustContactController,
                                                          label:
                                                              'Trust Contact',
                                                          type: TextInputType
                                                              .text,
                                                          height: 8, validate:
                                                              (String? value) {
                                                        if (value!.isEmpty) {
                                                          return "Please Enter Your Trust Contact";
                                                        }
                                                        return null;
                                                      }),
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: defaultFormField(
                                                          context,
                                                          controller: cubit
                                                              .trustContactRelationController,
                                                          label: 'Relation',
                                                          height: 8,
                                                          type: TextInputType
                                                              .text,
                                                          validate:
                                                              (String? value) {
                                                        if (value!.isEmpty) {
                                                          return "Please Enter Your Trust Contact Relation";
                                                        }
                                                        return null;
                                                      }),
                                                    ),
                                                  ],
                                                ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          doctor == true
                                              ? defaultFormField(context,
                                                  controller: cubit
                                                      .professionlanguagesController,
                                                  type: TextInputType.text,
                                                  label: 'Languages',
                                                  validate: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return "Please Enter Your Profession Languages";
                                                  }
                                                  return null;
                                                })
                                              : defaultFormField(
                                                  context,
                                                  label: 'Medical History',
                                                  maxlines: 4,
                                                  height: 13,
                                                  controller: cubit
                                                      .mediacalHistoryController,
                                                  type: TextInputType.text,
                                                  validate: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Medical History must not be empty";
                                                    }
                                                    return null;
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
                                                      function: () {
                                                        LoginCubit.get(context)
                                                            .updateUser(
                                                                contactRelation:
                                                                    cubit
                                                                        .trustContactRelationController
                                                                        .text,
                                                                email: cubit
                                                                    .emailController
                                                                    .text,
                                                                id: Userid,
                                                                /* languages:
                                                                cubit.professionlanguagesController.text, */
                                                                medicalHistory:
                                                                    cubit
                                                                        .mediacalHistoryController
                                                                        .text,
                                                                mobilePhone: cubit
                                                                    .phoneController
                                                                    .text,
                                                                profession: cubit
                                                                    .professionValue,
                                                                trustContact: cubit
                                                                    .trustContactController
                                                                    .text,
                                                                userName: cubit
                                                                    .nameController
                                                                    .text);
                                                      },
                                                      text: 'Save',
                                                      isUpperCase: false))
                                            ],
                                          ),
                                        ],
                                      ),
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
                          height: 17.h,
                          child: Center(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 50.0,
                                      backgroundImage: model?.image == null
                                          ? Image.asset(
                                                  'icons/icons8-man-232.png')
                                              .image
                                          : Image.network(
                                              '${model?.image}',
                                              fit: BoxFit.fill,
                                            ).image,
                                    ),
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

  Widget buildRadioBig(String value, context) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: LoginCubit.get(context).professionValue,
            onChanged: (value) {
              LoginCubit.get(context).changeProfessinValue(value);
            }),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        )
      ],
    );
  }
}

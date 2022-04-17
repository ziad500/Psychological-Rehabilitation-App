import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/modules/login_screen/login_cubit.dart';
import 'package:phsyo/modules/login_screen/login_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class EditeProfileScreen extends StatelessWidget {
  var NameController = TextEditingController();
  var trustContactController = TextEditingController();
  var TrustContactRelationController = TextEditingController();
  var EmailController = TextEditingController();
  var phoneController = TextEditingController();
  var mediacalHistoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = LoginCubit.get(context).loginmodel;
        NameController.text = 'Name : ${model?.name}';
        trustContactController.text =
            'Trust Contact Phone : ${model?.trustContact}';
        TrustContactRelationController.text =
            'Trust Contact Relation : ${model?.contactRelation}';
        EmailController.text = 'Email : ${model?.message}';
        phoneController.text = 'Phone : ${model?.mobilePhone}';
        mediacalHistoryController.text =
            'Medical History : ${model?.medicalHistory}';
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
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 18, right: 18, bottom: 0),
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 40.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.asset('icons/pngegg.png')),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    defaultFormField(context,
                        controller: NameController,
                        label: 'user Name',
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
                        controller: EmailController,
                        label: 'Email',
                        height: 8,
                        type: TextInputType.text, validate: (String? value) {
                      final bool isValid = EmailValidator.validate(value!);

                      if (isValid == false || value.isEmpty) {
                        return "Please Enter valid Email";
                      }
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultFormField(context,
                        controller: phoneController,
                        height: 8,
                        label: 'phone Number',
                        type: TextInputType.text, validate: (String? value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your phone Number";
                      }
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: defaultFormField(context,
                              controller: trustContactController,
                              label: 'Trust Contact',
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
                              controller: TrustContactRelationController,
                              label: 'Relation',
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
                    defaultFormField(
                      context,
                      label: 'Medical History',
                      maxlines: 4,
                      height: 13,
                      controller: mediacalHistoryController,
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

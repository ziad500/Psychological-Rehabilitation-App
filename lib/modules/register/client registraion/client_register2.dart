import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register1.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register3.dart';
import 'package:phsyo/modules/register/register_cubit/register_cubit.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:phsyo/modules/register/register_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class clientRegister2 extends StatefulWidget {
  final String firstName;
  final String lastName;
  var mobileNumber;
  final String Gender;
  final String email;
  final String password;

  clientRegister2(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.email,
      required this.password,
      required this.Gender})
      : super(key: key);

  @override
  State<clientRegister2> createState() => _clientRegister2State();
}

class _clientRegister2State extends State<clientRegister2> {
  var dateController = TextEditingController();

  var mediacalHistoryController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var MopileEmergencyController = TextEditingController();

  var contactRelationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'profile ',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Profile',
                              style:
                                  TextStyle(color: defaultColor, fontSize: 17),
                            ),
                          ],
                        ),
                        ListTile(
                          leading: RegisterCubit.get(context).profileImage ==
                                  null
                              ? CircleAvatar(
                                  radius: 30.0,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.asset('icons/pngegg.png')),
                                )
                              : CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: Image.file(
                                    RegisterCubit.get(context).profileImage!,
                                    fit: BoxFit.cover,
                                  ).image),
                          title: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                children: const [
                                  Text('Upload a professional '),
                                  Text('profile photo')
                                ],
                              )),
                          trailing: defaultButton(
                              function: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => bottomSheet(),
                                );
                              },
                              text: 'Upload',
                              width: 80,
                              verticalpadding: 10,
                              textsize: 9.sp),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 130,
                          decoration: const BoxDecoration(
                            color: Color(0xffE8E8EE),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Date of birth',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.calendar_today_rounded,
                                      color: defaultColor,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: dateController,
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate:
                                                DateTime.parse("2023-12-30"))
                                        .then((value) {
                                      dateController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Date must not be empty";
                                    }
                                  },
                                  /* onTap: () {
                        }, */
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    hintText: '--/--/----',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0.0),
                                    ),
                                    /* contentPadding: EdgeInsets.symmetric(
                            vertical: 0.0,
                          ), */
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        defaultFormField(context,
                            controller: MopileEmergencyController,
                            type: TextInputType.number, validate: (value) {
                          if (value!.isEmpty) {
                            return "Mopile Emergency must not be Empty";
                          }
                        }, hint: 'Mopile Emergency'),
                        SizedBox(
                          height: 2.h,
                        ),
                        defaultFormField(context,
                            controller: contactRelationController,
                            type: TextInputType.number, validate: (value) {
                          if (value!.isEmpty) {
                            return "Relation must not be Empty";
                          }
                        }, hint: 'Contact Relation'),
                        SizedBox(
                          height: 2.h,
                        ),
                        defaultFormField(
                          context,
                          hint: 'Medical History',
                          maxlines: 4,
                          controller: mediacalHistoryController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return "Medical History must not be Empty";
                            }
                          },
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                // passData();
                                print('login Success');
                                navigateTo(
                                    context,
                                    clientRegister3(
                                      email: widget.email,
                                      Gender: widget.Gender,
                                      lastName: widget.lastName,
                                      firstName: widget.firstName,
                                      mobileNumber: widget.mobileNumber,
                                      password: widget.password,
                                      MopileEmergency:
                                          MopileEmergencyController.text,
                                      contactRelation: contactRelationController
                                          .text
                                          .toString(),
                                      date: dateController.text.toString(),
                                      mediacalHistory: mediacalHistoryController
                                          .text
                                          .toString(),
                                    ));
                              }
                            },
                            text: 'continue'),
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
      listener: (context, state) {},
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          const Text(
            'choose Profile Photo',
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                borderRadius: BorderRadius.circular(12.0),
                color: defaultColor,
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                      onTap: () {
                        RegisterCubit.get(context)
                            .getProfileImage(ImageSource.camera);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          Text(
                            'Camera',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Material(
                borderRadius: BorderRadius.circular(12.0),
                color: defaultColor,
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                      onTap: () {
                        RegisterCubit.get(context)
                            .getProfileImage(ImageSource.gallery);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.image,
                            color: Colors.white,
                          ),
                          Text(
                            'Gallery',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

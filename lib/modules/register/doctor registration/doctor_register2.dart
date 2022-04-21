import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register1.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register3.dart';
import 'package:phsyo/modules/register/doctor%20registration/doctor_register3.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class doctorRegister2 extends StatefulWidget {
  @override
  State<doctorRegister2> createState() => _doctorRegister2State();
}

class _doctorRegister2State extends State<doctorRegister2> {
  bool TermsOfService = false;

  var dateController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var LicIssuedDateController = TextEditingController();
  var LicExpiryDateController = TextEditingController();

  List<String> selected = [];

  var Profession;
  List<String> Joblist = [
    'Therapist',
    'Life coach',
    'Yoga instructor',
    'Nutrionist '
  ];

  var LangList = [
    'Arabic',
    'English',
    'French',
    'Russian',
    'Chinese',
    'German',
    'Korean',
    'Turkish',
    'Japanese',
    'Hindi'
  ];

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text('$item'),
      );

  void passData() {
    CasheHelper.saveData(key: 'dateDoctor', value: dateController.text);
    CasheHelper.saveData(
        key: 'LicIssuedDateDoctor', value: LicIssuedDateController.text);
    CasheHelper.saveData(
        key: 'LicExpiryDateDoctor', value: LicExpiryDateController.text);
    CasheHelper.saveData(key: 'Profession', value: Profession);
    /* CasheHelper.saveData(
        key: 'mediacalHistory', value: mediacalHistoryController.text); */
    AppCubit.get(context).getNameImage('profileImageDoctor');
    AppCubit.get(context).getNamelicenseImage('licenseImageDoctor');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
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
            body: bigScreen(context));
      },
    );
  }

  Widget bigScreen(context) => Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
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
                        style: TextStyle(color: defaultColor, fontSize: 17),
                      ),
                    ],
                  ),
                  ListTile(
                    leading: AppCubit.get(context).profileImage == null
                        ? CircleAvatar(
                            radius: 30.0,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset('icons/pngegg.png')),
                          )
                        : CircleAvatar(
                            radius: 30.0,
                            backgroundImage: Image.file(
                              AppCubit.get(context).profileImage!,
                              fit: BoxFit.cover,
                            ).image),
                    title: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Column(
                        children: const [
                          Text('Upload a professional '),
                          Text('Profile Photo. '),
                        ],
                      ),
                    ),
                    trailing: defaultButton(
                        function: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => bottomSheet(camera: () {
                              AppCubit.get(context)
                                  .getImage(ImageSource.camera);
                            }, gallery: () {
                              AppCubit.get(context)
                                  .getImage(ImageSource.gallery);
                            }),
                          );
                        },
                        text: 'Upload',
                        width: 20.w,
                        verticalpadding: 10,
                        textsize: 9.sp),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 110,
                    decoration: const BoxDecoration(
                      color: Color(0xffE8E8EE),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
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
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: dateController,
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse("2023-12-30"))
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
                              errorStyle: TextStyle(fontSize: 0),
                              isDense: true,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 10, 10, 0),
                              hintText: '--/--/----',
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide:
                                    BorderSide(color: Colors.white, width: 0.0),
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
                    height: 1.5.h,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    width: double.infinity,
                    height: 7.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFFe8e8ee),
                    ),
                    child: DropdownButton(
                      iconEnabledColor: defaultColor,
                      iconSize: 30,
                      underline: Container(
                        color: Colors.transparent,
                      ),
                      isExpanded: true,
                      hint: const Text('Your Profession'),
                      value: Profession,
                      items: Joblist.map(buildMenuItem).toList(),
                      onChanged: (x) {
                        setState(() {
                          Profession = x;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      width: double.infinity,
                      height: 7.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFe8e8ee),
                      ),
                      child: Center(
                        child: DropDownMultiSelect(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              fillColor: Color(0xFFe8e8ee),
                              isCollapsed: true),
                          onChanged: (List<String> list) {
                            setState(() {
                              selected = list;
                              print(selected);
                              LangList = list;
                            });
                          },
                          options: [
                            'Arabic',
                            'English',
                            'French',
                            'Russian',
                            'Chinese',
                            'German',
                            'Korean',
                            'Turkish',
                            'Japanese',
                            'Hindi'
                          ],
                          whenEmpty: 'languages',
                          selectedValues: selected,
                        ),
                      )),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => bottomSheet(
                          camera: () => AppCubit.get(context)
                              .getlicenseImage(ImageSource.camera),
                          gallery: () => AppCubit.get(context)
                              .getlicenseImage(ImageSource.gallery),
                        ),
                      );
                    },
                    child: Container(
                        width: double.infinity,
                        height: 8.h,
                        decoration: const BoxDecoration(
                          color: Color(0xffE8E8EE),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: /* AppCubit.get(context).licenseImage == null
                          ? 
                          : */
                            AppCubit.get(context).licenseImage == null
                                ? FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.image,
                                          color: defaultColor,
                                          size: 35,
                                        ),
                                        Text(
                                          'Upload photo of license',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: Image.file(
                                        AppCubit.get(context).licenseImage!,
                                        fit: BoxFit.cover,
                                      ).image)),
                                    ),
                                  )),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultFormField(
                          context,
                          hint: 'Lic. Issued Date',
                          hintsize: 2,
                          controller: LicIssuedDateController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "Please Enter avalid Date";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: defaultFormField(
                          context,
                          hintsize: 2,
                          hint: 'Lic. Expiry Date',
                          controller: LicExpiryDateController,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return "Please Enter avalid Date";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.all(0.0),
                    minVerticalPadding: 0.0,
                    title: CheckboxListTile(
                      contentPadding: const EdgeInsets.all(0),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: TermsOfService,
                      onChanged: (value) {
                        setState(() {
                          TermsOfService = value!;
                          if (value == true) {
                            TermsOfService = true;
                          } else if (value == false) {
                            TermsOfService = false;
                          }
                        });
                      },
                      title: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            Text(
                              'I\'ve read and agree with ',
                              style: TextStyle(
                                  fontSize: 2.h, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Terms of service',
                                  style: TextStyle(
                                      color: defaultColor,
                                      fontSize: 2.h,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  defaultButton(
                      function: () {
                        print(Profession);
                        if (formKey.currentState!.validate()) {
                          if (TermsOfService == true) {
                            passData();
                            navigateTo(context, doctorRegister3());
                          } else {
                            showToast(
                                text: 'please agree the terms of services',
                                state: ToastStates.WARNING,
                                textColor: Colors.black);
                          }
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
      );

  Widget smallScreen(context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(color: defaultColor, fontSize: 14),
                    ),
                  ],
                ),
                ListTile(
                  leading: AppCubit.get(context).profileImage == null
                      ? CircleAvatar(
                          radius: 30.0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset('icons/pngegg.png')),
                        )
                      : CircleAvatar(
                          radius: 30.0,
                          backgroundImage: Image.file(
                            AppCubit.get(context).profileImage!,
                            fit: BoxFit.cover,
                          ).image),
                  title: Text(
                    'Upload a professional profile photo',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  trailing: defaultButton(
                      function: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => bottomSheet(),
                        );
                      },
                      text: 'Upload',
                      width: 20.w,
                      verticalpadding: 10,
                      textsize: 9.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: double.infinity,
                  height: 125,
                  decoration: BoxDecoration(
                    color: Color(0xffE8E8EE),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Date of birth',
                              style: TextStyle(fontSize: 15),
                            ),
                            Spacer(),
                            Icon(
                              Icons.calendar_today_rounded,
                              color: defaultColor,
                              size: 20,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.datetime,
                          controller: dateController,
                          onTap: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse("2023-12-30"))
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
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            hintText: '--/--/----',
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 0.0),
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
                /*  defaultFormField(context,
                    verticalpadding: 10.0,
                    hintsize: 10.0,
                    controller: MopileEmergencyController,
                    type: TextInputType.number,
                    validate: (value) {},
                    hint: 'mobile Number'), */
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => bottomSheet(
                        camera: () => AppCubit.get(context)
                            .getlicenseImage(ImageSource.camera),
                        gallery: () => AppCubit.get(context)
                            .getlicenseImage(ImageSource.gallery),
                      ),
                    );
                  },
                  child: Container(
                      width: double.infinity,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color(0xffE8E8EE),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: /* AppCubit.get(context).licenseImage == null
                        ? 
                        : */
                          AppCubit.get(context).licenseImage == null
                              ? FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.image,
                                        color: defaultColor,
                                        size: 35,
                                      ),
                                      Text(
                                        'Upload photo of license',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: Image.file(
                                      AppCubit.get(context).licenseImage!,
                                      fit: BoxFit.cover,
                                    ).image)),
                                  ),
                                )),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: defaultFormField(
                        context,
                        verticalpadding: 10.0,
                        hintsize: 10.0,
                        hint: 'Lic. Issued Date',
                        controller: LicIssuedDateController,
                        type: TextInputType.text,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter avalid Date";
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
                        verticalpadding: 10.0,
                        hintsize: 10.0,
                        hint: 'Lic. Expiry Date',
                        controller: LicExpiryDateController,
                        type: TextInputType.text,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter avalid Date";
                          }
                        },
                      ),
                    ),
                  ],
                ),
                ListTile(
                  title: CheckboxListTile(
                    contentPadding: EdgeInsets.all(0),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: TermsOfService,
                    onChanged: (value) {
                      setState(() {
                        TermsOfService = value!;
                        if (value == true) {
                          TermsOfService = true;
                        } else if (value == false) {
                          TermsOfService = false;
                        }
                      });
                    },
                    title: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          const Text(
                            'I\'ve read and agree with ',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Terms of service',
                                style: TextStyle(
                                    color: defaultColor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                defaultButton(
                    verticalpadding: 10.0,
                    textsize: 10.0,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        if (TermsOfService == true) {
                          passData();
                          navigateTo(context, doctorRegister3());
                        } else {
                          showToast(
                              text: 'please agree the terms of services',
                              state: ToastStates.WARNING,
                              textColor: Colors.black);
                        }
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
      );
}

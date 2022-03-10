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
  @override
  State<clientRegister2> createState() => _clientRegister2State();
}

class _clientRegister2State extends State<clientRegister2> {
  var dateController = TextEditingController();

  var mediacalHistoryController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  var MopileEmergencyController = TextEditingController();

  var contactRelationController = TextEditingController();

  void passData() {
    CasheHelper.saveData(key: 'date', value: dateController.text);
    CasheHelper.saveData(
        key: 'MopileEmergency', value: MopileEmergencyController.text);
    CasheHelper.saveData(
        key: 'contactRelation', value: contactRelationController.text);
    CasheHelper.saveData(
        key: 'mediacalHistory', value: mediacalHistoryController.text);
  }

  void getNameImage() {
    if (pickedImage == null) return;
    String base64 = base64Encode(pickedImage!.readAsBytesSync());
    String imageName = pickedImage!.path.split('/').last;
    CasheHelper.saveData(key: 'Image', value: imageName);
  }

  File? pickedImage;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    setState(() {
      pickedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        navigateTo(context, clientRegister1());
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                  title: const Text(
                    'profile ',
                    style: TextStyle(color: Colors.black),
                  ),
                  centerTitle: true,
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
                  },
                ));
          },
        ));
  }

  Widget bigScreen(context) => SingleChildScrollView(
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
                      style: TextStyle(color: defaultColor, fontSize: 17),
                    ),
                  ],
                ),
                ListTile(
                  leading: pickedImage == null
                      ? CircleAvatar(
                          radius: 30.0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset('icons/pngegg.png')),
                        )
                      : CircleAvatar(
                          radius: 30.0,
                          backgroundImage: Image.file(
                            pickedImage!,
                            fit: BoxFit.cover,
                          ).image),
                  /* CircleAvatar(
                    child: ClipRRect(
                      child: RegisterCubit.get(context).pickedImage == null
                          ? Image.asset('icons/pngegg.png')
                          : Image.file(RegisterCubit.get(context).pickedImage!),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    radius: 30.0,
                  ),  */
                  title: Text('Upload a professional profile photo'),
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
                defaultFormField(context,
                    controller: MopileEmergencyController,
                    type: TextInputType.number,
                    validate: (value) {},
                    hint: 'Mopile Emergency'),
                SizedBox(
                  height: 2.h,
                ),
                defaultFormField(context,
                    controller: contactRelationController,
                    type: TextInputType.number,
                    validate: (value) {},
                    hint: 'Contact Relation'),
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
                      return "Medical History must not be city";
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        getNameImage();
                        passData();
                        print('login Success');
                        navigateTo(context, clientRegister3());
                      }
                    },
                    text: 'continue'),
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
                  leading: pickedImage == null
                      ? CircleAvatar(
                          radius: 30.0,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset('icons/pngegg.png')),
                        )
                      : CircleAvatar(
                          radius: 30.0,
                          backgroundImage: Image.file(
                            pickedImage!,
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
                  height: 120,
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
                              style: TextStyle(fontSize: 10.sp),
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
                defaultFormField(context,
                    verticalpadding: 10.0,
                    hintsize: 10.0,
                    controller: MopileEmergencyController,
                    type: TextInputType.number,
                    validate: (value) {},
                    hint: 'mobile Number'),
                SizedBox(
                  height: 2.h,
                ),
                defaultFormField(context,
                    verticalpadding: 10.0,
                    hintsize: 10.0,
                    controller: contactRelationController,
                    type: TextInputType.number,
                    validate: (value) {},
                    hint: 'Contact Relation'),
                SizedBox(
                  height: 2.h,
                ),
                defaultFormField(
                  context,
                  verticalpadding: 10.0,
                  hintsize: 10.0,
                  hint: 'Medical History',
                  maxlines: 4,
                  controller: mediacalHistoryController,
                  type: TextInputType.text,
                  validate: (value) {
                    if (value!.isEmpty) {
                      return "Date must not be city";
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                defaultButton(
                    verticalpadding: 10.0,
                    textsize: 10.0,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        getNameImage();
                        passData();
                        print('Sign Up Success');
                        navigateTo(context, clientRegister3());
                      }
                    },
                    text: 'continue'),
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

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          Text(
            'choose Profile Photo',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
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
                        getImage(ImageSource.camera);
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
                        getImage(ImageSource.gallery);
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

// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';

import 'package:phsyo/modules/register/doctor%20registration/doctor_register3.dart';
import 'package:phsyo/modules/register/register_cubit/register_cubit.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class DoctorRegister2 extends StatefulWidget {
  final String firstName;
  final String lastName;
  // ignore: prefer_typing_uninitialized_variables
  var mobileNumber;
  final String gender;
  final String email;
  final String password;

  DoctorRegister2(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.gender,
      required this.email,
      required this.password})
      : super(key: key);
  @override
  State<DoctorRegister2> createState() => _DoctorRegister2State();
}

class _DoctorRegister2State extends State<DoctorRegister2> {
  var dateController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  List<String> selected = [];

  var Profession;
  List<String> joblist = [
    'Therapist',
    'Life coach',
    'Yoga instructor',
    'Nutrionist '
  ];

  var langList = [
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
        child: Text(item),
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
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
                          leading: RegisterCubit.get(context)
                                      .profileDoctorImage ==
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
                                    RegisterCubit.get(context)
                                        .profileDoctorImage!,
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
                                    RegisterCubit.get(context)
                                        .getProfileDoctorImage(
                                            ImageSource.camera);
                                  }, gallery: () {
                                    RegisterCubit.get(context)
                                        .getProfileDoctorImage(
                                            ImageSource.gallery);
                                  }),
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
                          height: 110,
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
                                    return null;
                                  },
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    errorStyle: const TextStyle(fontSize: 0),
                                    isDense: true,
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        10, 10, 10, 0),
                                    hintText: '--/--/----',
                                    hintStyle: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 0.0),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 8),
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
                            items: joblist.map(buildMenuItem).toList(),
                            onChanged: (x) {
                              setState(() {
                                Profession = x;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Container(
                            padding: const EdgeInsets.only(left: 10, right: 20),
                            width: double.infinity,
                            height: 7.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFFe8e8ee),
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
                                    // print(selected);
                                    langList = list;
                                  });
                                },
                                options: const [
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
                          height: 2.h,
                        ),
                        defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                navigateTo(
                                    context,
                                    DoctorRegister3(
                                      gender: widget.gender,
                                      profession: Profession,
                                      date: dateController.text.toString(),
                                      email: widget.email,
                                      firstName: widget.firstName,
                                      languages: selected,
                                      lastName: widget.lastName,
                                      password: widget.password,
                                      mobileNumber: widget.mobileNumber,
                                    ));
                              }
                            },
                            text: 'continue'),
                        SizedBox(
                          height: 2.h,
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
    );
  }
}

// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:phsyo/modules/register/doctor%20registration/doctor_register4.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../layout/cubit/app_cubit.dart';
import '../register_cubit/register_cubit.dart';

class DoctorRegister3 extends StatefulWidget {
  final String firstName;
  final String lastName;
  var mobileNumber;
  final String gender;
  final String email;
  final String password;
  final String date;
  final String profession;
  var languages;
  DoctorRegister3(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.gender,
      required this.email,
      required this.mobileNumber,
      required this.password,
      required this.date,
      required this.profession,
      required this.languages})
      : super(key: key);

  @override
  State<DoctorRegister3> createState() => _DoctorRegister3State();
}

class _DoctorRegister3State extends State<DoctorRegister3> {
  var formKey = GlobalKey<FormState>();
  // bool TermsOfService = false;

  var licIssuedDateController = TextEditingController();
  var licExpiryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<RegisterCubit, RegisterStates>(
          listener: (context, state) {
            if (state is AppRegisterDoctorSuccessState) {
              showToast(text: 'success', state: ToastStates.success);
              navigateTo(
                  context,
                  DoctorRegister4(
                      email: widget.email, password: widget.password));
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => bottomSheet(
                                  text: 'License',
                                  camera: () => AppCubit.get(context)
                                      .getlicenseImage(ImageSource.camera),
                                  gallery: () => AppCubit.get(context)
                                      .getlicenseImage(ImageSource.gallery),
                                ),
                              );
                            },
                            child: Container(
                                width: double.infinity,
                                height: 180,
                                decoration: const BoxDecoration(
                                  color: Color(0xffE8E8EE),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
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
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                AppCubit.get(context)
                                                    .licenseImage!,
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
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate:
                                                DateTime.parse("2023-12-30"))
                                        .then((value) {
                                      licIssuedDateController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                  hint: 'Lic. Issued Date',
                                  controller: licIssuedDateController,
                                  type: TextInputType.text,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter avalid Date";
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
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate:
                                                DateTime.parse("2023-12-30"))
                                        .then((value) {
                                      licExpiryDateController.text =
                                          DateFormat.yMd().format(value!);
                                    });
                                    /*  var time = DateTime(DateTime.now().day,
                                      DateTime.now().month, DateTime.now().year)
                                  .difference(DateTime.parse(
                                      licExpiryDateController.text.toString()));
                              print('time is : $time'); */
                                  },
                                  hint: 'Lic. Expiry Date',
                                  controller: licExpiryDateController,
                                  type: TextInputType.text,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter avalid Date";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          /*           ListTile(
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
                       */
                          SizedBox(
                            height: 2.h,
                          ),
                          defaultButton(
                              verticalpadding: 10.0,
                              textsize: 10.0,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  /*  print(widget.profession);
                                  print(widget.languages); */

                                  //  print('success');
                                  RegisterCubit.get(context).signUpDoctor(
                                      firstName: widget.firstName,
                                      lastName: widget.lastName,
                                      email: widget.email,
                                      password: widget.password,
                                      mobilePhone: widget.mobileNumber,
                                      gender: widget.gender,
                                      birthDate: widget.date,
                                      languages: widget.languages,
                                      profession: widget.profession,
                                      licIssuedDate:
                                          licIssuedDateController.text,
                                      licExpiryDate:
                                          licExpiryDateController.text);
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
              ),
            );
          },
        ));
  }
}

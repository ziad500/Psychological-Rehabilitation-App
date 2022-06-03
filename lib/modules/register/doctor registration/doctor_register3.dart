import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phsyo/modules/register/doctor%20registration/doctor_register4.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../layout/cubit/app_cubit.dart';
import '../../../shared/network/cashe_helper.dart';

class doctorRegister3 extends StatefulWidget {
  final String firstName;
  final String lastName;
  var mobileNumber;
  final String Gender;
  final String email;
  final String password;
  final String date;
  final String Profession;
  final List languages;
  doctorRegister3(
      {Key? key,
      required this.firstName,
      required this.lastName,
      required this.Gender,
      required this.email,
      required this.mobileNumber,
      required this.password,
      required this.date,
      required this.Profession,
      required this.languages})
      : super(key: key);

  @override
  State<doctorRegister3> createState() => _doctorRegister3State();
}

class _doctorRegister3State extends State<doctorRegister3> {
  var formKey = GlobalKey<FormState>();
  // bool TermsOfService = false;

  var LicIssuedDateController = TextEditingController();
  var LicExpiryDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
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
                    defaultButton(
                        verticalpadding: 10.0,
                        textsize: 10.0,
                        function: () {
                          if (formKey.currentState!.validate()) {
                            print('success');
                            navigateTo(
                                context,
                                doctorRegister4(
                                  Gender: widget.Gender,
                                  LicExpiryDate:
                                      LicExpiryDateController.text.toString(),
                                  date: widget.date,
                                  LicIssuedDate:
                                      LicIssuedDateController.text.toString(),
                                  email: widget.email,
                                  firstName: widget.firstName,
                                  lastName: widget.lastName,
                                  mobileNumber: widget.mobileNumber,
                                  password: widget.password,
                                  Profession: widget.Profession,
                                  languages: widget.languages,
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
        ),
      ),
    );
  }
}

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';

class EditeProfileDoctorScreen extends StatelessWidget {
  var NameController = TextEditingController();
  var EmailController = TextEditingController();
  var phoneController = TextEditingController();
  var professionController = TextEditingController();
  var professionlanguagesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    NameController.text = 'Name : ziad elblidy';
    EmailController.text = 'Email : ziad.gemy@gmail.com';
    phoneController.text = 'Business Phone : 01224122391';
    professionController.text = 'Profession : Therapist';
    professionlanguagesController.text =
        'Proficient Languages : Arabic, English';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50.0,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Icon(Icons.calendar_today)),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                defaultFormField(context,
                    controller: NameController,
                    type: TextInputType.text, validate: (String? value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Name";
                  }
                }),
                SizedBox(
                  height: 10,
                ),
                defaultFormField(context,
                    controller: EmailController,
                    type: TextInputType.text, validate: (String? value) {
                  final bool isValid = EmailValidator.validate(value!);

                  if (isValid == false || value.isEmpty) {
                    return "Please Enter valid Email";
                  }
                }),
                SizedBox(
                  height: 10,
                ),
                defaultFormField(context,
                    controller: phoneController,
                    type: TextInputType.text, validate: (String? value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Phone";
                  }
                }),
                SizedBox(
                  height: 10,
                ),
                defaultFormField(context,
                    controller: professionController,
                    type: TextInputType.text, validate: (String? value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Profession";
                  }
                }),
                SizedBox(
                  height: 10,
                ),
                defaultFormField(context,
                    controller: professionlanguagesController,
                    type: TextInputType.text, validate: (String? value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Profession Languages";
                  }
                }),
                SizedBox(
                  height: 20,
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
                            function: () {}, text: 'Save', isUpperCase: false))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
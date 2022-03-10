import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';

class EditeProfileScreen extends StatelessWidget {
  var NameController = TextEditingController();
  var trustContactController = TextEditingController();
  var TrustContactRelationController = TextEditingController();
  var EmailController = TextEditingController();
  var phoneController = TextEditingController();
  var mediacalHistoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    NameController.text = 'Name : ziad elblidy';
    trustContactController.text = 'Trust Contact Phone : 01224122391';
    TrustContactRelationController.text = 'Trust Contact Relation : uncle';
    EmailController.text = 'Email : ziad.gemy@gmail.com';
    phoneController.text = 'Phone : 01224122391';
    mediacalHistoryController.text =
        'Medical History : example example example';

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33.0, vertical: 10.0),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50.0,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image.asset('icons/pngegg.png')),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              defaultFormField(context,
                  controller: NameController,
                  type: TextInputType.text, validate: (String? value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Password";
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
                  return "Please Enter Your Password";
                }
              }),
              SizedBox(
                height: 10,
              ),
              defaultFormField(context,
                  controller: trustContactController,
                  type: TextInputType.text, validate: (String? value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Password";
                }
              }),
              SizedBox(
                height: 10,
              ),
              defaultFormField(context,
                  controller: TrustContactRelationController,
                  type: TextInputType.text, validate: (String? value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Password";
                }
              }),
              SizedBox(
                height: 10,
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
                height: 10,
              ),
              defaultButton(
                  function: () {},
                  text: 'Change Password',
                  borderColor: defaultColor,
                  color: Colors.white,
                  textColor: defaultColor,
                  isUpperCase: false),
              SizedBox(
                height: 10,
              ),
              defaultButton(function: () {}, text: 'Save', isUpperCase: false)
            ],
          ),
        ),
      ),
    );
  }
}

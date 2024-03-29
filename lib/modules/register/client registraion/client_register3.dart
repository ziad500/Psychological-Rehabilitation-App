import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register4.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';

import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../register_cubit/register_cubit.dart';

class ServicesModel {
  final String? title;
  final String? avatarImage;
  bool isCheck = false;
  ServicesModel(
      {required this.title, required this.avatarImage, required isCheck});
}

// ignore: must_be_immutable
class ClientRegister3 extends StatefulWidget {
  final String firstName;
  final String lastName;
  // ignore: prefer_typing_uninitialized_variables
  var mobileNumber;
  final String gender;
  final String email;
  final String password;
  final String date;
  // ignore: prefer_typing_uninitialized_variables
  var mobileEmergency;
  final String contactRelation;
  final String mediacalHistory;

  ClientRegister3({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.mobileNumber,
    required this.gender,
    required this.email,
    required this.password,
    required this.date,
    required this.mobileEmergency,
    required this.contactRelation,
    required this.mediacalHistory,
  }) : super(key: key);
  @override
  State<ClientRegister3> createState() => _ClientRegister3State();
}

class _ClientRegister3State extends State<ClientRegister3> {
  var listController = PageController();
  List<String> text = [];

  List<ServicesModel> services = [
    ServicesModel(
        title: 'individual sessions',
        avatarImage: 'icons/icons8-person-neutral-skin-type-1-and-2-80.png',
        isCheck: false),
    ServicesModel(
        title: 'Couples Sessions',
        avatarImage: 'icons/icons8-couple-60.png',
        isCheck: false),
    ServicesModel(
        title: 'Family sessions',
        avatarImage: 'icons/icons8-family-80.png',
        isCheck: false),
    ServicesModel(
        title: 'Group sessions',
        avatarImage: 'icons/icons8-group-256.png',
        isCheck: false),
    ServicesModel(
        title: 'Teen sessions',
        avatarImage: 'icons/icons8-man-232.png',
        isCheck: false)
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is AppRegisterSuccessState) {
          showToast(text: 'success', state: ToastStates.success);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Services ',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: Column(
              children: [
                const FittedBox(
                    fit: BoxFit.scaleDown,
                    child:
                        Text('What type of session are you interested in ?')),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 60.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => myDivider(),
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        listTileItemm(services[index]),
                    itemCount: services.length,
                  ),
                ),
                const Spacer(),
                defaultButton(
                  function: () {
                    if (text.isEmpty) {
                      showToast(
                          text: 'Please Chosse', state: ToastStates.error);
                    } else {
                      CasheHelper.saveData(
                          key: 'Services', value: text.toList());
                      RegisterCubit.get(context).clientSignUp(
                          firstName: widget.firstName,
                          lastName: widget.lastName,
                          email: widget.email,
                          password: widget.password,
                          mobilePhone: widget.mobileNumber,
                          gender: widget.gender,
                          birthDate: widget.date,
                          trustContact: widget.mobileEmergency,
                          contactRelation: widget.contactRelation,
                          medicalHistory: widget.mediacalHistory,
                          sessions: text.toList());
                      navigateTo(
                          context,
                          ClientRegister4(
                            Gender: widget.gender,
                            MobileEmergency: widget.mobileEmergency,
                            contactRelation: widget.contactRelation,
                            date: widget.date,
                            email: widget.email,
                            firstName: widget.firstName,
                            lastName: widget.lastName,
                            mediacalHistory: widget.mediacalHistory,
                            mobileNumber: widget.mobileNumber,
                            password: widget.password,
                            services: text.toList(),
                          ));
                    }
                  },
                  text: 'continue',
                ),
                SizedBox(
                  height: 1.h,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
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
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ));
      },
    );
  }

  Widget listTileItemm(ServicesModel model) => Column(
        children: [
          ListTile(
            leading: Image.asset(
              '${model.avatarImage}',
              width: 40,
              height: 40,
            ),
            title: CheckboxListTile(
              value: model.isCheck,
              onChanged: (value) {
                setState(() {
                  model.isCheck = value!;
                  if (value == true) {
                    text.add('${model.title}');
                  } else if (value == false) {
                    text.remove('${model.title}');
                  }
                });
              },
              title: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '${model.title}',
                  style: TextStyle(fontSize: 13.0.sp),
                ),
              ),
            ),
          ),
        ],
      );
}

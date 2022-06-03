import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phsyo/layout/Doctor_cubit/cubit/abb_states.dart';
import 'package:phsyo/layout/Doctor/doctor_menu_screen.dart';
import 'package:phsyo/modules/appointments_screen/appointments_screen.dart';
import 'package:phsyo/modules/blogs_screen/blogs_screen.dart';
import 'package:phsyo/modules/home_screen.dart/home_screen.dart';
import 'package:phsyo/modules/menu_screen/menu_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/shared/network/dio_helper.dart';
import 'package:phsyo/shared/network/endpoint.dart';
import 'package:phsyo/styles/colors.dart';

import '../../../models/login_model/user_login_model.dart';
import '../../Doctor/doctor_appointments_screen.dart';

class AppDoctorCubit extends Cubit<AppDoctorStates> {
  AppDoctorCubit() : super(AppDoctorInitialState());
  static AppDoctorCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;

  List<String> Joblist = [
    'Therapist',
    'Life coach',
    'Yoga instructor',
    'Nutrionist '
  ];

  List<String> TitleScreens = ['Home', 'Appointments', 'Blogs', 'Menu'];

  List<Widget> bottomDoctorScreens = [
    AppointmentsDoctorScreen(),
    const MenuDoctorScreen(),
  ];

  void changeBottom(int index) {
    CurrentIndex = index;
    emit(AppDoctorChangeBottomNav());
  }
}

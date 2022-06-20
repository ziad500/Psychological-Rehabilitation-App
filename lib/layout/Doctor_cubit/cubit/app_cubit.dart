import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/Doctor_cubit/cubit/abb_states.dart';
import 'package:phsyo/layout/Doctor/doctor_menu_screen.dart';

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

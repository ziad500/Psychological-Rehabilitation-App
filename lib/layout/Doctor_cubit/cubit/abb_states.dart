import 'package:bloc/bloc.dart';

abstract class AppDoctorStates {}

class AppDoctorInitialState extends AppDoctorStates {}

class AppDoctorChangeBottomNav extends AppDoctorStates {}

class ImagePickerProfileSuccess extends AppDoctorStates {}

class ImagePickerLicenseSuccess extends AppDoctorStates {}

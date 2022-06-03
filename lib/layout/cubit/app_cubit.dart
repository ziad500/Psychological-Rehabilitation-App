import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/Doctor/doctor_menu_screen.dart';
import 'package:phsyo/models/articlesModel/articles_model.dart';
import 'package:phsyo/modules/appointments_screen/appointments_screen.dart';
import 'package:phsyo/modules/blogs_screen/blogs_screen.dart';
import 'package:phsyo/modules/home_screen.dart/home_screen.dart';
import 'package:phsyo/modules/menu_screen/menu_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/shared/network/dio_helper.dart';
import 'package:phsyo/shared/network/endpoint.dart';
import 'package:phsyo/styles/colors.dart';
import '../../layout/Doctor/doctor_appointments_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;

  List<String> Joblist = [
    'Therapist',
    'Life coach',
    'Yoga instructor',
    'Nutrionist '
  ];

  List<String> TitleScreens = ['Home', 'Appointments', 'Blogs', 'Menu'];
  List<Widget> titleScreen = [
    searchForm(),
    titleText('Appointments'),
    titleText('Blogs'),
    titleText('Menu'),
  ];

  List<Widget> bottomDoctorScreens = [
    AppointmentsDoctorScreen(),
    const MenuDoctorScreen(),
  ];

  List<Widget> bottomScreens = [
    HomeScreen(),
    AppointmentsScreen(),
    const BlogsScreen(),
    const MenuScreen(),
  ];

  void changeBottom(int index) {
    CurrentIndex = index;
    emit(AppChangeBottomNav());
  }

  File? profileImage;
  final ImagePicker picker = ImagePicker();

  Future getImage(
    ImageSource source,
  ) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    profileImage = File(image.path);
    emit(ImagePickerProfileSuccess());
  }

  void getNameImage(String key) {
    if (profileImage == null) return;
    String base64 = base64Encode(profileImage!.readAsBytesSync());
    String imageName = profileImage!.path.split('/').last;
    CasheHelper.saveData(key: key, value: imageName);
  }

  File? licenseImage;

  Future getlicenseImage(
    ImageSource source,
  ) async {
    final XFile? image = await picker.pickImage(source: source);
    if (image == null) {
      return;
    }
    licenseImage = File(image.path);
    emit(ImagePickerLicenseSuccess());
  }

  uploadimage(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String mobilePhone,
      required String gender,
      required String birthDate,
      required String trustContact,
      required String contactRelation,
      required String medicalHistory,
      required List<String> sessions}) async {
    var formData = FormData.fromMap({
      'profileImage': await MultipartFile.fromFile(licenseImage!.path),
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'mobilePhone': mobilePhone,
      'gender': gender,
      'birthDate': birthDate,
      'trustContact': trustContact,
      'contactRelation': contactRelation,
      'medicalHistory': medicalHistory,
      'sessions': sessions
    });
    var response = await DioHelper.postData(url: LOGIN, data: formData);
  }

  uploadimagee() async {
    var formData = FormData.fromMap(
        {'image': await MultipartFile.fromFile(licenseImage!.path)});
    var response = await DioHelper.dio.post('', data: formData);
  }

  void getNamelicenseImage(String key) {
    if (licenseImage == null) return;
    String base64 = base64Encode(licenseImage!.readAsBytesSync());
    String imageName = licenseImage!.path.split('/').last;
    CasheHelper.saveData(key: key, value: imageName);
  }

  List<articlesModel> articles = [
    articlesModel(
        name: 'Ziad Elblidy',
        category: '',
        title: 'testt new article',
        article:
            'testt new article testt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new articletestt new article',
        date: DateTime.now().toString())
  ];
  articlesModel? articlesmodel;
  void addToArticles({
    required String name,
    required String category,
    required String title,
    required String article,
  }) {
    articles.add(articlesModel(
        name: name,
        category: category,
        title: title,
        article: article,
        date: DateTime.now().toString()));
    emit(addToArticlesSuccess());
  }
}

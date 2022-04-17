import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/shared/network/dio_helper.dart';
import 'package:phsyo/shared/network/endpoint.dart';
import 'package:http_parser/http_parser.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(LoginInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool passwordvisible = true;
  IconData suffixpasswordvisible = Icons.visibility_outlined;

  void changepasswordvisible() {
    passwordvisible = !passwordvisible;
    suffixpasswordvisible = passwordvisible
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(changePasswordVisiblilityState());
  }

  bool passwordConfirmVisible = true;
  IconData suffixpasswordConfirmVisible = Icons.visibility_outlined;

  void changePasswordConfirmVisible() {
    passwordConfirmVisible = !passwordConfirmVisible;
    suffixpasswordConfirmVisible = passwordConfirmVisible
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(changeConfirmPasswordVisiblilityState());
  }

  String radiovalue = '';
  void changeRadio(value) {
    radiovalue = value;
    emit(changeRadioState());
  }

  final ImagePicker picker = ImagePicker();
  File? profileImage;

  Future getProfileImage(
    ImageSource source,
  ) async {
    final XFile? image = await picker.pickImage(
        source: source, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    if (image == null) {
      return null;
    }
    profileImage = File(image.path);

    emit(ImagePickerProfileSuccess());
    print(profileImage!.path);
  }
/*    void getNameImage(String key) {
    if (profileImage == null) return;
    String base64 = base64Encode(profileImage!.readAsBytesSync());
    String imageName = profileImage!.path.split('/').last;
    CasheHelper.saveData(key: key, value: imageName);
        emit(ImagePickerProfileSuccess());

  } */

  void signUp(
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
      required List sessions}) async {
/*     String fileName = file!.path.split('/').last;
 */
    var bytes =
        (await rootBundle.load('icons/pngegg.png')).buffer.asUint8List();

    emit(AppRegisterLoadingState());
    var data = FormData.fromMap({
      'profileImage': profileImage == null
          ? await MultipartFile.fromBytes(bytes)
          : await MultipartFile.fromFile(
              profileImage!.path,
              contentType: new MediaType('image', 'jpg'),
            ),
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

    await DioHelper.postData(url: REGISTER, data: data).then((value) {
      print(value);
      emit(AppRegisterSuccessState());
    }).catchError((error) {
      print('$error');
      emit(AppRegisterErrorState());
    });

    /*  Dio dio = new Dio();

    dio
        .post("https://healthmental-you.herokuapp.com/auth/signup/User",
            data: data)
        .then((response) => print(response))
        .catchError((error) => print(error)); */
  }

  Future<String> uploadimage(
      {File? profileImage,
      required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String mobilePhone,
      required String gender,
      required String birthDate,
      required String trustContact,
      required String contactRelation,
      required String medicalHistory,
      required List sessions}) async {
    emit(AppRegisterLoadingState());
    String imageName = profileImage!.path.split('/').last;
    String base64 = base64Encode(profileImage.readAsBytesSync());
    var bytes =
        (await rootBundle.load('icons/pngegg.png')).buffer.asUint8List();

    print(imageName);
    print('path is ${profileImage.path}');
    var formData = FormData.fromMap({
      'profileImage': await MultipartFile.fromFile(profileImage.path,
          filename: imageName,
          contentType: new MediaType('profileImage', 'jpeg')),
      'firstName': await MultipartFile.fromBytes(bytes),
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
    var response =
        await DioHelper.postData(url: REGISTER, data: formData).then((value) {
      print('success');
      emit(AppRegisterSuccessState());
    }).catchError((error) {
      print('$error');
      print('zzzzz${profileImage.path}');
      emit(AppRegisterErrorState());
    });
    return response.toString();
  }
}

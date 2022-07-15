import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phsyo/models/Doctor_registerModel/Doctor_register_model.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:phsyo/shared/network/dio_helper.dart';
import 'package:phsyo/shared/network/endpoint.dart';
import 'package:http_parser/http_parser.dart';

import '../../../models/login_model/user_login_model.dart';
import '../../../shared/components/components.dart';

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
    emit(ChangePasswordVisiblilityState());
  }

  bool passwordConfirmVisible = true;
  IconData suffixpasswordConfirmVisible = Icons.visibility_outlined;

  void changePasswordConfirmVisible() {
    passwordConfirmVisible = !passwordConfirmVisible;
    suffixpasswordConfirmVisible = passwordConfirmVisible
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangeConfirmPasswordVisiblilityState());
  }

  String radiovalue = '';
  void changeRadio(value) {
    radiovalue = value;
    emit(ChangeRadioState());
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
  }

  LoginModel? loginmodel;

  void clientSignUp(
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
    emit(AppRegisterLoadingState());
    var data = FormData.fromMap({
      'profileImage': await MultipartFile.fromFile(
        profileImage!.path,
        contentType: MediaType('image', 'jpg'),
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
      loginmodel = LoginModel.fromJson(value.data);
      emit(AppRegisterSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        loginmodel = LoginModel.fromJson(error.response!.data);
        showToast(text: loginmodel!.message, state: ToastStates.error);
      }
      emit(AppRegisterErrorState());
    });
  }

  File? profileDoctorImage;

  Future getProfileDoctorImage(
    ImageSource source,
  ) async {
    final XFile? image = await picker.pickImage(
        source: source, imageQuality: 50, maxHeight: 500, maxWidth: 500);
    if (image == null) {
      return null;
    }
    profileDoctorImage = File(image.path);

    emit(ImagePickerProfileDoctorSuccess());
    print(profileDoctorImage!.path);
  }

  DoctorRegisterModel? doctorRegisterModel;
  void signUpDoctor(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String mobilePhone,
      required String gender,
      required String birthDate,
      required List languages,
      required String profession,
      required String licIssuedDate,
      required String licExpiryDate}) async {
    emit(AppRegisterDoctorLoadingState());
    var data = FormData.fromMap({
      'profileImage': await MultipartFile.fromFile(
        profileDoctorImage!.path,
        contentType: MediaType('image', 'jpg'),
      ),
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'mobilePhone': mobilePhone,
      'gender': gender,
      'birthDate': birthDate,
      'languages': languages,
      'profession': profession,
      'licIssuedDate': licIssuedDate,
      'licExpiryDate': licExpiryDate
    });

    await DioHelper.postData(url: REGISTER_DOCTOR, data: data).then((value) {
      doctorRegisterModel = DoctorRegisterModel.fromJson(value.data);
      emit(AppRegisterDoctorSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        doctorRegisterModel =
            DoctorRegisterModel.fromJson(error.response!.data);
        showToast(
            text: doctorRegisterModel?.data?.msg, state: ToastStates.error);
      }
      emit(AppRegisterDoctorErrorState());
    });
  }

  void verifyEmail(String email, String code) async {
    emit(AppLoadingVerifyState());
    await DioHelper.postData(url: VERIFY, data: {'email': email, 'code': code})
        .then((value) {
      emit(AppSuccessVerifyState());
    }).catchError((error) {
      emit(AppErrorVerifyState());
    });
  }
}

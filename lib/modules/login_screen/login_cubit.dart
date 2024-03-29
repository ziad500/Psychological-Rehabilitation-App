import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/constants.dart';
import 'package:phsyo/models/login_model/user_login_model.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/network/endpoint.dart';
import '../../models/profileModel/profile_model.dart';
import '../../shared/network/dio_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var trustContactController = TextEditingController();
  var trustContactRelationController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var mediacalHistoryController = TextEditingController();
  var professionController = TextEditingController();
  var professionlanguagesController = TextEditingController();

  bool isVisible = true;
  IconData suffix = Icons.visibility_outlined;

  void passwordvisible() {
    isVisible = !isVisible;
    suffix =
        isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisiblilityState());
  }

  String radiovalue = '';
  void changeRadio(value) {
    radiovalue = value;
    emit(ChangeRadioState());
  }

  String professionValue = '';
  void changeProfessinValue(value) {
    professionValue = value;
    emit(ProfessinvalueSuccessState());
  }

  LoginModel? loginmodel;
  void userLogin({required String email, required String password}) {
    emit(AppLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      loginmodel = LoginModel.fromJson(value.data);
      emit(AppLoginSuccessState(loginmodel!));
    }).catchError((error) {
      if (error is DioError) {
        loginmodel = LoginModel.fromJson(error.response!.data);
        showToast(text: loginmodel!.message, state: ToastStates.error);
      }
      emit(AppLoginErrorState(error.toString()));
    });
  }

  ProfileModel? profileModel;
  void getProfileData(String id) {
    emit(AppLoadingProfileDataState());
    DioHelper.getData(url: 'profile/$id').then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      emit(AppSuccessProfileDataState(profileModel!));
    }).catchError((error) {
      if (error is DioError) {}
      emit(AppErrorProfileDataState());
    });
  }

  void updateUser({
    String? id,
    String? userName,
    String? email,
    String? mobilePhone,
    String? trustContact,
    String? contactRelation,
    List? languages,
    String? profession,
    String? medicalHistory,
  }) {
    emit(AppLoadingUpdateProfileState());
    DioHelper.putData(url: 'profile/$id', token: token, data: {
      'name': userName,
      'email': email,
      'mobilePhone': mobilePhone,
      'trustContact': trustContact,
      if (doctor == false) 'contactRelation': contactRelation,
      if (doctor == false) 'medicalHistory': medicalHistory,
      if (doctor == true) 'languages': languages,
      if (doctor == true) 'profession': profession,
    }).then((value) {
      //print(value);
      getProfileData(id.toString());
      showToast(text: 'Update Successfully', state: ToastStates.success);
      emit(AppSuccessUpdateProfileState());
    }).catchError((error) {
      emit(AppErrorUpdateProfileState());
      // print(error);
    });
  }
}

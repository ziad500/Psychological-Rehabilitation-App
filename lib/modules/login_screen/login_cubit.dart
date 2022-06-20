import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/models/login_model/user_login_model.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/network/endpoint.dart';
import 'package:phsyo/shared/network/http_helper.dart';
import '../../models/profileModel/profile_model.dart';
import '../../shared/network/dio_helper.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;
  IconData suffix = Icons.visibility_outlined;

  void passwordvisible() {
    isVisible = !isVisible;
    suffix =
        isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(changePasswordVisiblilityState());
  }

  String radiovalue = '';
  void changeRadio(value) {
    radiovalue = value;
    emit(changeRadioState());
  }

  LoginModel? loginmodel;
  void userLogin({required String email, required String password}) {
    emit(AppLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {'email': email, 'password': password})
        .then((value) {
      loginmodel = LoginModel.fromJson(value.data);
      print(value.data);
      emit(AppLoginSuccessState(loginmodel!));
    }).catchError((error) {
      if (error is DioError) {
        loginmodel = LoginModel.fromJson(error.response!.data);
        showToast(text: loginmodel!.message, state: ToastStates.ERROR);
        print("error is ${loginmodel!.message}");
      }
      print('error is : $error');
      emit(AppLoginErrorState(error.toString()));
    });
  }

  ProfileModel? profileModel;
  void getProfileData(String id) {
    emit(AppLoadingProfileDataState());
    DioHelper.getData(url: 'profile/$id').then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      //print(profileModel?.user.contactRelation);
      emit(AppSuccessProfileDataState(profileModel!));
    }).catchError((error) {
      if (error is DioError) {
        print('error is ${error.response?.data}');
      }
      //  print('error is : $error');
      emit(AppErrorProfileDataState());
    });
  }

  /*  void doctorLogin({required String email, required String password}) {
    emit(AppLoginDoctorLoadingState());

    DioHelper.postData(
        url: LOGINDOCTOR,
        data: {'email': email, 'password': password}).then((value) {
      loginmodel = LoginModel.fromJson(value.data);
      print(value.data);
      emit(AppLoginDoctorSuccessState());
    }).catchError((error) {
      if (error is DioError) {
        loginmodel = LoginModel.fromJson(error.response!.data);
        showToast(text: loginmodel!.message, state: ToastStates.ERROR);
        print(loginmodel!.message);
      }
      emit(AppLoginDoctorErrorState());
    });
  }
 */
  /* void userr({required String email, required String password}) {
    emit(AppLoginLoadingState());

    HttpHelper()
        .postData(url: LOGIN, data: {'email': email, 'password': password});
    ;
  } */
}

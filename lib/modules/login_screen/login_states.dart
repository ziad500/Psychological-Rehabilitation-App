import 'package:phsyo/models/login_model/user_login_model.dart';
import 'package:phsyo/models/profileModel/profile_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangePasswordVisiblilityState extends LoginStates {}

class ProfessinvalueSuccessState extends LoginStates {}

class AppLoginLoadingState extends LoginStates {}

class AppLoginSuccessState extends LoginStates {
  final LoginModel loginModel;

  AppLoginSuccessState(this.loginModel);
}

class AppLoginErrorState extends LoginStates {
  final String error;

  AppLoginErrorState(this.error);
}

class ChangeRadioState extends LoginStates {}

class AppLoginDoctorLoadingState extends LoginStates {}

class AppLoginDoctorSuccessState extends LoginStates {}

class AppLoginDoctorErrorState extends LoginStates {}

class AppLoadingProfileDataState extends LoginStates {}

class AppSuccessProfileDataState extends LoginStates {
  final ProfileModel profileModel;

  AppSuccessProfileDataState(this.profileModel);
}

class AppErrorProfileDataState extends LoginStates {}

class AppLoadingUpdateProfileState extends LoginStates {}

class AppSuccessUpdateProfileState extends LoginStates {}

class AppErrorUpdateProfileState extends LoginStates {}

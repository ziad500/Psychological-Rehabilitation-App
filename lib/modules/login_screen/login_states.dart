import 'package:phsyo/models/login_model/user_login_model.dart';
import 'package:phsyo/models/profileModel/profile_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class changePasswordVisiblilityState extends LoginStates {}

class AppLoginLoadingState extends LoginStates {}

class AppLoginSuccessState extends LoginStates {
  final LoginModel loginModel;

  AppLoginSuccessState(this.loginModel);
}

class AppLoginErrorState extends LoginStates {
  final String error;

  AppLoginErrorState(this.error);
}

class changeRadioState extends LoginStates {}

class AppLoginDoctorLoadingState extends LoginStates {}

class AppLoginDoctorSuccessState extends LoginStates {
/*   final UserModel loginModel;

  AppLoginSuccessState(this.loginModel); */
}

class AppLoginDoctorErrorState extends LoginStates {
/*   final String error;

  AppLoginErrorState(this.error); */
}

class AppLoadingProfileDataState extends LoginStates {}

class AppSuccessProfileDataState extends LoginStates {
  final ProfileModel profileModel;

  AppSuccessProfileDataState(this.profileModel);
}

class AppErrorProfileDataState extends LoginStates {}

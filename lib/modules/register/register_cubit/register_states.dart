abstract class RegisterStates {}

class LoginInitialState extends RegisterStates {}

class ChangePasswordVisiblilityState extends RegisterStates {}

class ChangeConfirmPasswordVisiblilityState extends RegisterStates {}

class ChangeRadioState extends RegisterStates {}

class ChangeRadioServiceState extends RegisterStates {}

class ImagePickerProfileSuccess extends RegisterStates {}

class AppRegisterLoadingState extends RegisterStates {}

class AppRegisterSuccessState extends RegisterStates {
  /*  final UserModel loginModel;

  AppLoginSuccessState(this.loginModel); */
}

class AppRegisterErrorState extends RegisterStates {
  /* final String error;

  AppRegisterErrorState(this.error); */
}

class ImagePickerProfileDoctorSuccess extends RegisterStates {}

class AppRegisterDoctorLoadingState extends RegisterStates {}

class AppRegisterDoctorSuccessState extends RegisterStates {}

class AppRegisterDoctorErrorState extends RegisterStates {}

class AppLoadingVerifyState extends RegisterStates {}

class AppSuccessVerifyState extends RegisterStates {}

class AppErrorVerifyState extends RegisterStates {}

abstract class RegisterStates {}

class LoginInitialState extends RegisterStates {}

class changePasswordVisiblilityState extends RegisterStates {}

class changeConfirmPasswordVisiblilityState extends RegisterStates {}

class changeRadioState extends RegisterStates {}

class changeRadioServiceState extends RegisterStates {}

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

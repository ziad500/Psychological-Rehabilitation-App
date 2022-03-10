abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class changePasswordVisiblilityState extends LoginStates {}

class AppLoginLoadingState extends LoginStates {}

class AppLoginSuccessState extends LoginStates {
  /* final AppLoginModel loginModel;

  AppLoginSuccessState(this.loginModel); */
}

class AppLoginErrorState extends LoginStates {
  final String error;

  AppLoginErrorState(this.error);
}

class changeRadioState extends LoginStates {}

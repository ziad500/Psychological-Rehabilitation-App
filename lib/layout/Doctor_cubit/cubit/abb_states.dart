abstract class AppDoctorStates {}

class AppDoctorInitialState extends AppDoctorStates {}

class AppDoctorChangeBottomNav extends AppDoctorStates {}

class ImagePickerProfileSuccess extends AppDoctorStates {}

class AppRegisterLoadingState extends AppDoctorStates {}

class AppRegisterSuccessState extends AppDoctorStates {
  /*  final UserModel loginModel;

  AppLoginSuccessState(this.loginModel); */
}

class AppRegisterErrorState extends AppDoctorStates {
  /* final String error;

  AppRegisterErrorState(this.error); */
}

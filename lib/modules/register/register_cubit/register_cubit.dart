import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';

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

/*   String radiovalueService = '';
  void changeRadioService(value) {
    radiovalueService = value;
    emit(changeRadioServiceState());
  } */
}

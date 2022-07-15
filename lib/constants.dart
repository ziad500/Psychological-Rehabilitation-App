import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/modules/login_screen/login_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';

void signout(context) {
  AppCubit.get(context).currentIndex = 0;
  CasheHelper.removeData(key: 'token').then((value) {
    if (value) {
      CasheHelper.removeData(key: 'doctor');
      CasheHelper.removeData(key: 'Userid');
      doctor = false;
      //   AppCubit.get(context).CurrentIndex = 0;
      navigateAndFinish(context, LoginScreen());
    }
  });
}

bool Doctor(context) {
  if (role == 'user') {
    doctor = false;
  } else if (role == 'doctor') {
    doctor = true;
  }
  return doctor!;
}

dynamic token = '';
bool? doctor;
dynamic role = '';
dynamic Userid = '';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/modules/appointments_screen/appointments_screen.dart';
import 'package:phsyo/modules/blogs_screen/blogs_screen.dart';
import 'package:phsyo/modules/home_screen.dart/home_screen.dart';
import 'package:phsyo/modules/menu_screen/menu_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;

  List<String> TitleScreens = ['Home', 'Appointments', 'Blogs', 'Menu'];

  List<Widget> BottomScreens = [
    HomeScreen(),
    AppointmentsScreen(),
    BlogsScreen(),
    MenuScreen(),
  ];

  void changeBottom(int index) {
    CurrentIndex = index;
    emit(AppChangeBottomNav());
  }
}

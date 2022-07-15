import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/styles/colors.dart';

import '../constants.dart';

class Applayout extends StatelessWidget {
  const Applayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 6.0,
              centerTitle: true,
              /*   leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.network(
                          "https://scontent.fcai22-1.fna.fbcdn.net/v/t1.6435-9/119635227_2753084281647593_5838415930791994978_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=174925&_nc_ohc=tqF-NeJqlL4AX-g4naq&tn=Z5IcDg5zDufeQZq7&_nc_ht=scontent.fcai22-1.fna&oh=00_AT_s-HYkc3whc6kyCLsImEOT7Qbtikh_3ZYgySKqT5S13g&oe=62CC9ACD")),
                ),
              ), */
              title: doctor == true
                  ? cubit.titleDoctorScreens[cubit.currentIndex]
                  : cubit.titleScreen[cubit.currentIndex]),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            height: 60.0,
            color: defaultColor,
            buttonBackgroundColor: defaultColor,
            index: cubit.currentIndex,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            letIndexChange: (index) => true,
            items: <Widget>[
              if (doctor == false)
                const Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.white,
                ),
              const Icon(
                Icons.calendar_today,
                size: 30,
                color: Colors.white,
              ),
              const Icon(
                Icons.menu_book_outlined,
                size: 30,
                color: Colors.white,
              ),
              const Icon(
                Icons.menu,
                size: 30,
                color: Colors.white,
              ),
            ],
            onTap: (index) {
              cubit.changeBottom(index);
            },
          ),
          body: doctor == true
              ? cubit.bottomDoctorScreens[cubit.currentIndex]
              : cubit.bottomScreens[cubit.currentIndex],
        );
      },
    );
  }
}

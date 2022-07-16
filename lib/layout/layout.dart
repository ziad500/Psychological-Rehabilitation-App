import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/modules/login_screen/login_cubit.dart';
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
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 50.0,
                  backgroundImage:
                      LoginCubit.get(context).profileModel?.user.image == null
                          ? Image.asset('icons/icons8-man-232.png').image
                          : Image.network(
                              '${LoginCubit.get(context).profileModel?.user.image}',
                              fit: BoxFit.fill,
                            ).image,
                ),
              ),
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

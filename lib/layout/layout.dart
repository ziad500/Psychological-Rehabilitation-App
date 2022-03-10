import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/modules/menu_screen/menu_screen.dart';
import 'package:phsyo/styles/colors.dart';

import '../shared/components/components.dart';

class AppLayout extends StatelessWidget {
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
            leading: Image.asset(
              'icons/logo.png',
            ),
            title: Text(
              cubit.TitleScreens[cubit.CurrentIndex],
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            height: 60.0,
            color: defaultColor,
            buttonBackgroundColor: defaultColor,
            index: cubit.CurrentIndex,
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 300),
            letIndexChange: (index) => true,
            items: <Widget>[
              Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.calendar_today,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.menu_book_outlined,
                size: 30,
                color: Colors.white,
              ),
              Icon(
                Icons.menu,
                size: 30,
                color: Colors.white,
              ),
            ],
            onTap: (index) {
              cubit.changeBottom(index);
            },
          ),
          body: cubit.BottomScreens[cubit.CurrentIndex],
        );
      },
    );
  }
}

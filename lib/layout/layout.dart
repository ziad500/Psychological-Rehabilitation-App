import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/modules/menu_screen/menu_screen.dart';
import 'package:phsyo/styles/colors.dart';

import '../shared/components/components.dart';

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
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message,
                      color: defaultColor,
                    ))
              ],
              leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.network(
                          "https://scontent.fcai22-1.fna.fbcdn.net/v/t1.6435-9/119635227_2753084281647593_5838415930791994978_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=174925&_nc_ohc=9w1vCey7WysAX9eScbQ&_nc_ht=scontent.fcai22-1.fna&oh=00_AT_lRREybImxXPn64hDYskKnm0d_gr_injuVrM-EnM1tew&oe=628569CD")),
                ),
              ),
              title: cubit.titleScreen[cubit.CurrentIndex]),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            height: 60.0,
            color: defaultColor,
            buttonBackgroundColor: defaultColor,
            index: cubit.CurrentIndex,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            letIndexChange: (index) => true,
            items: const <Widget>[
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
          body: cubit.bottomScreens[cubit.CurrentIndex],
        );
      },
    );
  }
}

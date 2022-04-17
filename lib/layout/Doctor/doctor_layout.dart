import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/Doctor_cubit/cubit/abb_states.dart';
import 'package:phsyo/layout/Doctor_cubit/cubit/app_cubit.dart';
import 'package:phsyo/layout/Doctor/doctor_menu_screen.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:phsyo/shared/components/components.dart';

import '../cubit/app_cubit.dart';

class AppDoctorLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppDoctorCubit, AppDoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppDoctorCubit.get(context);
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 6.0,
            centerTitle: true,
            /*  leading: Padding(
              padding: const EdgeInsets.all(6.0),
              child: CircleAvatar(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.network(
                        "https://z-p3-scontent.fcai22-1.fna.fbcdn.net/v/t39.30808-6/243452328_3043766322579386_7410635147796981286_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=174925&_nc_ohc=JUPaiWDNUo8AX8fupxV&_nc_ht=z-p3-scontent.fcai22-1.fna&oh=00_AT924X-fxaEmRNjULZ4piaQahkEhbWJ3TUafgAg9pNaIdg&oe=6230DD34")),
              ),
            ), */
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
                Icons.calendar_today,
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
          body: cubit.bottomDoctorScreens[cubit.CurrentIndex],
        );
      },
    );
  }
}

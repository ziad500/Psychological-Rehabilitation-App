import 'package:flutter/material.dart';
import 'package:phsyo/constants.dart';
import 'package:phsyo/models/login_model/user_login_model.dart';
import 'package:phsyo/models/profileModel/profile_model.dart';
import 'package:phsyo/modules/appoint_screen/appoint_screen.dart';
import 'package:phsyo/modules/edite_profile/edite_profile_screen.dart';
import 'package:phsyo/modules/faqs_screen/faqs_screen.dart';
import 'package:phsyo/modules/favoriteScreen/favorite_screen.dart';
import 'package:phsyo/modules/login_screen/login_cubit.dart';
import 'package:phsyo/modules/payment_screen/payment_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';
import 'package:sizer/sizer.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80, left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            defaultButton(
                function: () {
                  signout(context);
                },
                icon: Icons.logout,
                text: 'Log Out'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  menuItem(
                      context,
                      'Edit Profile',
                      const Icon(
                        Icons.person,
                        color: Color(0xFF4A4B4D),
                      ),
                      onTap: () => navigateTo(context, EditeProfileScreen())),
                  if (doctor == true)
                    menuItem(
                        context,
                        'Available Hours',
                        const Icon(
                          Icons.timer,
                          color: Color(0xFF4A4B4D),
                        ),
                        onTap: () => navigateTo(
                            context,
                            AppointScreen(
                              id: LoginCubit.get(context)
                                  .profileModel!
                                  .user
                                  .id
                                  .toString(),
                              isDoctor: true,
                              salary: '',
                              image: '',
                              job: '',
                              name: '',
                            ))),
                  if (doctor == false)
                    menuItem(
                        context,
                        'Favourite Doctor',
                        const Icon(
                          Icons.favorite_border,
                          color: Color(0xFF4A4B4D),
                        ),
                        onTap: () =>
                            navigateTo(context, const FavoriteScreen())),
                  menuItem(
                      context,
                      'Payment Info',
                      const Icon(
                        Icons.payment,
                        color: Color(0xFF4A4B4D),
                      ),
                      onTap: () => navigateTo(context, PaymentScreen())),
                  if (doctor == false)
                    menuItem(
                      context,
                      'FAQ\'s',
                      const Icon(
                        Icons.quiz_outlined,
                        color: Color(0xFF4A4B4D),
                      ),
                      onTap: () => navigateTo(context, const FaqsScreen()),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem(context, String text, Widget icon, {Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey.shade300),
        child: Material(
          borderRadius: BorderRadius.circular(22.0),
          color: const Color(0xffE8E8EE),
          //elevation: 5.0,
          child: InkWell(
            borderRadius: BorderRadius.circular(22.0),
            splashColor: defaultColor,
            splashFactory: InkSplash.splashFactory,
            onTap: onTap,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: icon,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: const Color(0XFF4A4B4D),
                      fontSize: 2.2.h),
                  textAlign: TextAlign.left,
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF4A4B4D),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

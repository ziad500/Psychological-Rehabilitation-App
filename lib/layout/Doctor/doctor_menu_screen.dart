import 'package:flutter/material.dart';
import 'package:phsyo/layout/Doctor/doctor_edite_profile_screen.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';

class MenuDoctorScreen extends StatelessWidget {
  const MenuDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Icon(
                        Icons.person,
                        color: Color(0xFF4A4B4D),
                      ), onTap: () {
                    navigateTo(context, EditeProfileDoctorScreen());
                  }),
                  menuItem(
                    context,
                    'Available Hours',
                    Icon(
                      Icons.access_time,
                      color: Color(0xFF4A4B4D),
                    ),
                  ),
                  menuItem(
                      context,
                      'Payment Info',
                      Icon(
                        Icons.payment,
                        color: Color(0xFF4A4B4D),
                      )),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 100.0),
              child: defaultButton(
                  function: () {}, icon: Icons.logout, text: 'Log Out'),
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
          color: Color(0xffE8E8EE),
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
                  '$text',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF4A4B4D),
                      fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
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

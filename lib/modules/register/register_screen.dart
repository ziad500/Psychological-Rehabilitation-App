import 'package:flutter/material.dart';
import 'package:phsyo/modules/register/doctor%20registration/doctor_register1.dart';
import 'package:sizer/sizer.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register1.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: defaultColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: defaultColor,
          elevation: 0.0,
        ),
        body: bigScreen(context));
  }

  Widget bigScreen(context) => Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 60.0)],
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40.0)),
                  ),
                  width: double.infinity,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Register as',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24.sp),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Center(
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Choose your account type',
                                  style: TextStyle(fontSize: 16.0.sp),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 1.h),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Material(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: Colors.white,
                                      elevation: 2.0,
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        splashColor: Colors.grey,
                                        splashFactory: InkSplash.splashFactory,
                                        onTap: () {
                                          navigateTo(
                                              context, DoctorRegister1());
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10.0)),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.h, vertical: 2.h),
                                            child: Column(
                                              children: [
                                                Image(
                                                  image: const AssetImage(
                                                      'icons/icons8-id-verified-64.png'),
                                                  height: 7.h,
                                                ),
                                                Text(
                                                  'Admin',
                                                  style: TextStyle(
                                                      fontSize: 16.0.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  maxLines: 1,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: Material(
                                      borderRadius: BorderRadius.circular(12.0),
                                      color: Colors.white,
                                      elevation: 2.0,
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        splashColor: Colors.grey,
                                        splashFactory: InkSplash.splashFactory,
                                        onTap: () {
                                          navigateTo(
                                              context, ClientRegister1());
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10.0)),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.h, vertical: 2.h),
                                            child: Column(
                                              children: [
                                                Image(
                                                  image: const AssetImage(
                                                      'icons/icons8-user-48.png'),
                                                  height: 7.h,
                                                ),
                                                Text(
                                                  'User',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0.sp,
                                                  ),
                                                  maxLines: 1,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 25.h,
            child: Center(
              child: Row(
                children: const [
                  Expanded(
                    child: Image(
                      image: AssetImage('icons/undraw_secure_login_pdn4.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}

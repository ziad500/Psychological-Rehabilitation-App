import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:phsyo/modules/login_screen/login_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register1.dart';
import 'package:phsyo/shared/components/components.dart';
import 'package:phsyo/shared/constraints.dart';
import 'package:phsyo/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: defaultColor,
        appBar: AppBar(
          backgroundColor: defaultColor,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                navigateTo(context, LoginScreen());
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxHeight >= 600.0) {
              return BigScreen(context);
            } else {
              return SmallScreen(context);
            }
          },
        ));
  }

  Widget BigScreen(context) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100.h),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 17.h,
                    ),
                    Expanded(
                      child: Container(
                        height: 80.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 60.0)],
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(40.0)),
                        ),
                        /* height: (MediaQuery.of(context).size.height -
                                        appbar.preferredSize.height -
                                        MediaQuery.of(context).padding.top //-
                                    //120
                                    ), */
                        width: double.infinity,
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.all(30.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    Center(
                                      child: Text(
                                        'Register as',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Center(
                                      child: Text(
                                        'Choose your account type',
                                        style: TextStyle(fontSize: 16.0.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.h),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Material(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              color: Colors.white,
                                              elevation: 2.0,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                splashColor: Colors.grey,
                                                splashFactory:
                                                    InkSplash.splashFactory,
                                                onTap: () {},
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.h,
                                                            vertical: 2.h),
                                                    child: Column(
                                                      children: [
                                                        Image(
                                                          image: AssetImage(
                                                              'icons/icons8-id-verified-64.png'),
                                                          height: 7.h,
                                                        ),
                                                        Text(
                                                          'Admin',
                                                          style: TextStyle(
                                                              fontSize: 16.0.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              color: Colors.white,
                                              elevation: 2.0,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                splashColor: Colors.grey,
                                                splashFactory:
                                                    InkSplash.splashFactory,
                                                onTap: () {
                                                  navigateTo(context,
                                                      clientRegister1());
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.h,
                                                            vertical: 2.h),
                                                    child: Column(
                                                      children: [
                                                        Image(
                                                          image: AssetImage(
                                                              'icons/icons8-user-48.png'),
                                                          height: 7.h,
                                                        ),
                                                        Text(
                                                          'User',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
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
                          ],
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
                            image: AssetImage(
                                'icons/undraw_secure_login_pdn4.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget SmallScreen(context) => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 100.h),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Expanded(
                      child: Container(
                        height: 80.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 60.0)],
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(40.0)),
                        ),
                        /* height: (MediaQuery.of(context).size.height -
                                        appbar.preferredSize.height -
                                        MediaQuery.of(context).padding.top //-
                                    //120
                                    ), */
                        width: double.infinity,
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            Center(
                              child: Padding(
                                padding: EdgeInsets.all(30.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Center(
                                      child: Text(
                                        'Register as',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Center(
                                      child: Text(
                                        'Choose your account type',
                                        style: TextStyle(fontSize: 14.0.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 1.h),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Material(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              color: Colors.white,
                                              elevation: 2.0,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                splashColor: Colors.grey,
                                                splashFactory:
                                                    InkSplash.splashFactory,
                                                onTap: () {},
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.h,
                                                            vertical: 2.h),
                                                    child: Column(
                                                      children: [
                                                        Image(
                                                          image: AssetImage(
                                                              'icons/icons8-id-verified-64.png'),
                                                          height: 5.h,
                                                        ),
                                                        Text(
                                                          'Admin',
                                                          style: TextStyle(
                                                              fontSize: 13.0.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
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
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              color: Colors.white,
                                              elevation: 2.0,
                                              child: InkWell(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                splashColor: Colors.grey,
                                                splashFactory:
                                                    InkSplash.splashFactory,
                                                onTap: () {
                                                  navigateTo(context,
                                                      clientRegister1());
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10.0)),
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 2.h,
                                                            vertical: 2.h),
                                                    child: Column(
                                                      children: [
                                                        Image(
                                                          image: AssetImage(
                                                            'icons/icons8-user-48.png',
                                                          ),
                                                          height: 5.h,
                                                        ),
                                                        Text(
                                                          'User',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14.0.sp,
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
                          ],
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
                            image: AssetImage(
                                'icons/undraw_secure_login_pdn4.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

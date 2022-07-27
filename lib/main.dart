import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phsyo/constants.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/layout/layout.dart';

import 'package:phsyo/modules/login_screen/login_cubit.dart';
import 'package:phsyo/modules/onboarding_screen/onboarding_screen.dart';
import 'package:phsyo/modules/register/register_cubit/register_cubit.dart';
import 'package:phsyo/modules/splashScreen/splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:device_preview/device_preview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phsyo/modules/login_screen/login_screen.dart';

import 'package:phsyo/shared/network/bloc_observer.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/shared/network/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CasheHelper.init();
  Bloc.observer = MyBlocObserver();
  Widget widget = const OnBoardingScreen();

  //bool? isDark = CasheHelper.getData(key: 'isDark');

  bool? onBoarding = CasheHelper.getData(key: 'onBoarding');
  token = CasheHelper.getData(key: 'token');
  userid = CasheHelper.getData(key: 'Userid');
  doctor = CasheHelper.getData(key: 'doctor');
  // favorite != null ? favorite = CasheHelper.getData(key: 'favorite') : null;
  /*  CasheHelper.removeData(key: 'token');
 CasheHelper.removeData(key: 'Userid');
 CasheHelper.removeData(key: 'doctor'); */
//  print(doctor);
//  print('.....${userid}');
//  print(role);

  // print(token);

  if (onBoarding != null) {
    if (token != null) {
      widget = const Applayout();
    } else {
      widget = LoginScreen();
      // CasheHelper.removeData(key: 'onBoarding');
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(
    /* DevicePreview(
    builder: (context) =>  */
    MyApp(startWidget: widget),
    /* enabled: !kReleaseMode,
  ) */
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({Key? key, required this.startWidget}) : super(key: key);
  //const MyApp(this.startWidget);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => AppCubit()
                ..getDoctorsData()
                ..getArticles()
                ..getAppointment()
                ..getDoctorAppointment()),
          BlocProvider(
              create: (context) =>
                  LoginCubit()..getProfileData(userid.toString())),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            /*  if (state is AppLoginSuccessState) {
              AppCubit.get(context).doctor = true;
            } */
          },
          builder: (context, state) {
            return Sizer(builder: (context, orientation, deviceType) {
              return MaterialApp(
                  useInheritedMediaQuery: true,
                  locale: DevicePreview.locale(context),
                  builder: DevicePreview.appBuilder,
                  theme: ThemeData(
                    scaffoldBackgroundColor: Colors.white,
                    appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      titleTextStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ),
                    ),
                    primarySwatch: Colors.blue,
                    textTheme: GoogleFonts.poppinsTextTheme(
                      Theme.of(context).textTheme,
                    ),
                  ),
                  debugShowCheckedModeBanner: false,
                  home: AnimatedSplashScreen(
                    splash: const SplashScreen(),
                    duration: 3000,
                    nextScreen: /* doctorRegister4(
                        email: '', password: '')  */
                        startWidget,
                    splashTransition: SplashTransition.fadeTransition,
                    pageTransitionType: PageTransitionType.fade,
                  ));
            });
          },
        ));
  }
}

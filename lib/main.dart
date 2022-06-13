import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/constants.dart';
import 'package:phsyo/layout/Doctor_cubit/cubit/app_cubit.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/layout/layout.dart';

import 'package:phsyo/modules/login_screen/login_cubit.dart';

import 'package:phsyo/modules/onboarding_screen/onboarding_screen.dart';

import 'package:phsyo/modules/register/register_cubit/register_cubit.dart';

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
  Widget widget = OnBoardingScreen();
  //bool? isDark = CasheHelper.getData(key: 'isDark');

  bool? onBoarding = CasheHelper.getData(key: 'onBoarding');
  token = CasheHelper.getData(key: 'token');
  print(token);

  if (onBoarding != null) {
    if (token != null) {
      widget = Applayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }

  runApp(
    /* DevicePreview(
    builder: (context) =>  */
    MyApp(widget),
    /*  enabled: !kReleaseMode,
  ) */
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp(this.startWidget);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit(),
          ),
          BlocProvider(
            create: (context) => LoginCubit(),
          ),
          BlocProvider(
            create: (context) => RegisterCubit(),
          ),
          BlocProvider(
            create: (context) => AppDoctorCubit(),
          )
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
                  home: LoginScreen()
                  /* doctorRegister4(
                    Gender: '',
                    LicExpiryDate: '',
                    LicIssuedDate: '',
                    Profession: '',
                    date: '',
                    email: '',
                    firstName: '',
                    languages: [],
                    lastName: '',
                    mobileNumber: '',
                    password: 's',
                  ) */
                  /*     AnimatedSplashScreen(
                  splash: const SplashScreen(),
                  nextScreen: startWidget,
                  duration: 3000,
                  splashTransition: SplashTransition.fadeTransition,
                ), */
                  );
            });
          },
        ));
  }
}

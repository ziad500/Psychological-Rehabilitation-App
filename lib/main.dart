import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phsyo/layout/cubit/abb_states.dart';
import 'package:phsyo/layout/cubit/app_cubit.dart';
import 'package:phsyo/layout/layout.dart';
import 'package:phsyo/modules/edite_profile/edite_profile_screen.dart';
import 'package:phsyo/modules/forget_password/create_new_password.dart';
import 'package:phsyo/modules/forget_password/forget_password.dart';
import 'package:phsyo/modules/forget_password/verify_code.dart';
import 'package:phsyo/modules/home_screen.dart/home_screen.dart';
import 'package:phsyo/modules/login_screen/login_cubit.dart';
import 'package:phsyo/modules/login_screen/login_states.dart';
import 'package:phsyo/modules/menu_screen/menu_screen.dart';
import 'package:phsyo/modules/onboarding_screen/onboarding.dart';
import 'package:phsyo/modules/onboarding_screen/onboarding_screen.dart';
import 'package:phsyo/modules/profile_screen/profile_screen.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register2.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register3.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register4.dart';
import 'package:phsyo/modules/register/register_cubit/register_cubit.dart';
import 'package:phsyo/modules/register/register_cubit/register_states.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phsyo/modules/login_screen/login_screen.dart';
import 'package:phsyo/modules/onboarding_screen/onbording_screenn.dart';
import 'package:phsyo/modules/register/client%20registraion/client_register1.dart';
import 'package:phsyo/modules/register/register_screen.dart';
import 'package:phsyo/shared/network/bloc_observer.dart';
import 'package:phsyo/shared/network/cashe_helper.dart';
import 'package:phsyo/shared/network/dio_helper.dart';
import 'package:phsyo/styles/colors.dart';
import 'modules/splashScreen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CasheHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit(),
          )
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Sizer(builder: (context, orientation, deviceType) {
              return MaterialApp(
                  theme: ThemeData(
                    appBarTheme: AppBarTheme(
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
                  home:
                      AppLayout() /* 
                    AnimatedSplashScreen(
                  splash: const SplashScreen(),
                  nextScreen: OnBoardingScreen(),
                  duration: 3000,
                  splashTransition: SplashTransition.fadeTransition,
                ), */
                  );
            });
          },
        ));
  }
}

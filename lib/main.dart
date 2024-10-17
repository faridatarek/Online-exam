import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/res/colors.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/presentation/login/LoginScreen.dart';
import 'package:online_exam/presentation/register/RegisterScreen.dart';

/*void main() {
  configureDependencies();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));

}*/
void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Online Exam',
          theme: ThemeData(
              fontFamily: "Inter",
              scaffoldBackgroundColor: whitebackgroundColor,
              primaryColor: primaryColor),
          home: RegisterScreen(),
        );
      },
    );
  }
}

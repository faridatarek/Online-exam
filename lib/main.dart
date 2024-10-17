import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/res/colors.dart';
import 'package:online_exam/core/token_manager.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/presentation/login/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  String? token = await TokenManager.getToken(key: 'token');

  runApp(MyApp(startScreen: token != null ? HomeScreen() : LoginScreen()));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;

  const MyApp({super.key, required this.startScreen});

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
            primaryColor: primaryColor,
          ),
          home: startScreen, // Start with either HomeScreen or LoginScreen
        );
      },
    );
  }
}

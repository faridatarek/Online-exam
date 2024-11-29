import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/providers/appConfigProvider.dart';
import 'package:online_exam/core/res/colors.dart';
import 'package:online_exam/core/res/toke_manager.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/presentation/Exams/Subjects/SubjectsScreen.dart';
import 'package:online_exam/presentation/login/LoginScreen.dart';
import 'package:provider/provider.dart';

/*void main() {
  configureDependencies();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));

}*/
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  String? token= await TokenManager.getToken(key:"token");
  getIt.get<AppConfigProvider>().token=token??"";
  runApp(ChangeNotifierProvider(
    create: (context) =>getIt.get<AppConfigProvider>(),
      child: const MyApp()));
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
            primaryColor:primaryColor


          ),



          home:getIt<AppConfigProvider>().token.isEmpty?LoginScreen() :SubjectSearchView(),

        );
      },

    );
  }
}

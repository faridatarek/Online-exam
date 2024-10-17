import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/res/colors.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/domain/model/User.dart';
import 'package:online_exam/presentation/ForgetPassword/ForgetPasswordScreen.dart';
import 'package:online_exam/presentation/login/LoginViewModel.dart';
import 'package:online_exam/presentation/utils.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';
  bool _isButtonEnabled = false;

  void _checkFields() {
    setState(() {
      _isButtonEnabled = _email.isNotEmpty && _password.isNotEmpty;
    });
  }
  bool _isChecked = false;

  // Field injection
  LoginViewModel viewModel = getIt.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(

       appBar: AppBar(
         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
           elevation: 0,
           title: Padding(
             padding:  EdgeInsets.only(top:10.h),
             child: Row(children: [IconButton(onPressed:() {
             }, icon:Icon(Icons.arrow_back_ios,size:25,color: blackColor,)),
               Text("Login",style: TextStyle(color:blackColor,fontWeight:FontWeight.w500,fontSize: 20.sp),)], ),
           )),

        body: BlocListener<LoginViewModel,LoginScreenState>(

          listenWhen: (previous, current) {
            return current is LoadingState || current is ErrorState || current is SuccessState;
          },
          listener: (context, state) {
            if (state is LoadingState) {

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return AlertDialog(
                    content: Row(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 16),
                        Text("Loading...")
                      ],
                    ),
                  );
                },
              );
            }
            if (state is ErrorState) {
              Navigator.pop(context);
              var message = extractErrorMessage(state.exception);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Row(
                      children: [
                        Expanded(child: Text(message)),
                      ],
                    ),
                  );
                },
              );
            }

            if (state is SuccessState) {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen(user: state.user)),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    _email = value;
                    _checkFields();
                  },
                  style: TextStyle(fontSize: 15.sp),
                  decoration: InputDecoration(

                    labelText: 'Email',
                    hintText: 'Enter your email',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                          color: Color(0xffBDBDBD),
                          width: 1.0,
                        )),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color:Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),


                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(4.r)),
                  ),
                ),
                SizedBox(height:20.h,),
                TextFormField(
                  onChanged: (value) {
                    _password = value;
                    _checkFields();
                  },
                  style: TextStyle(fontSize: 15.sp),
                  decoration: InputDecoration(
                    counter:    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 20.w,
                              child: Checkbox(
                                activeColor:Theme.of(context).primaryColor,
                                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)
                                ),

                                focusColor: blackColor ,
                                value: _isChecked,
                                onChanged: (value) {
                                  _isChecked=!_isChecked;
                                  setState(() {

                                  });

                                },
                              ),
                            ),

                            SizedBox(width: 6.w,),
                            Text('Remember me',style: TextStyle(color:blackColor,fontSize:13.sp,
                                fontWeight: FontWeight.w400)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>ForgetPasswordScreen ()));
                          },
                          child: Text('Forgot Password?',style: TextStyle(color:blackColor,fontSize:12.sp,fontWeight: FontWeight.w400,decoration: TextDecoration.underline,),),
                        ),
                      ],
                    ),

                    labelText: 'Password',
                    hintText: 'Enter your password ',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        borderSide: BorderSide(
                          color: Color(0xffBDBDBD),
                          width: 1.0,
                        )),
                    focusedBorder:  OutlineInputBorder(
                      borderSide: BorderSide(
                        color:Theme.of(context).primaryColor,
                        width: 2.0,
                      ),
                    ),


                    border: OutlineInputBorder(


                        borderRadius: BorderRadius.circular(4.r)),
                  ),
                ),



                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<LoginViewModel,LoginScreenState>(
                  builder: (context, state) {
                    switch (state) {
                      case LoadingState():{
                        return CircularProgressIndicator();
                      }
                      default:{
                        return ElevatedButton(
                            onPressed:
                            _isButtonEnabled
                                ? () {
                              login();
                            }
                                : null,
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity.w, 48.h),
                            shape: RoundedRectangleBorder(

                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            backgroundColor: _isButtonEnabled
                                ?primaryColor
                                : Colors.grey,
                          ),

                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500,color:whitebackgroundColor),
                          ),);
                      }

                    }

                  },
                  buildWhen: (previous, current) {
                    return true;
                  },
                ),

                SizedBox(height: 15.h),
                Padding(
                  padding: const EdgeInsets.only(bottom:40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don’t have an account?',style: TextStyle(color: blackColor,fontSize:16.sp,fontWeight: FontWeight.w400)),

                      InkWell(
                          onTap: (){},
                          child: Text(' Sign Up',style: TextStyle(color:Theme.of(context).primaryColor,fontSize:16.sp,fontWeight: FontWeight.w500,decoration: TextDecoration.underline,))),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(){
    viewModel.doIntent(LoginIntent(_email, _password));
    // viewModel.doIntent();
  }
}


class HomeScreen extends StatelessWidget {
  final User? user;

  HomeScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Welcome, ${user?.firstName ??'Elevate'}')),
    );
  }
}





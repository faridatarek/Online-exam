import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/res/colors.dart';
import 'package:online_exam/di/di.dart';

import 'package:online_exam/presentation/login/LoginScreen.dart';
import 'package:online_exam/presentation/register/RegisterViewModel.dart';
import 'package:online_exam/presentation/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isLengthValid = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialChar = false;
  String? _errorText;

  ///////////////////////////////////////
  String _email = '';
  String _password = '';
  String _userName = '';
  String _firstName = '';
  String _lastName = '';
  String _confirmPassword = '';
  String _phone = '';
  bool _isButtonEnabled = false;


  void _checkFields() {
    setState(() {
      _isButtonEnabled = _email.isNotEmpty && _password.isNotEmpty
          && _userName.isNotEmpty && _firstName.isNotEmpty
          && _lastName.isNotEmpty && _confirmPassword.isNotEmpty
          && _phone.isNotEmpty
      ;
    });
  }

  RegisterViewModel viewModel = getIt.get<RegisterViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(

        appBar: AppBar(
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(children: [
                IconButton(onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios, size: 25, color: blackColor,)),
                Text("Sign up", style: TextStyle(color: blackColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp),)
              ],),
            )),

        body: BlocListener<RegisterViewModel, RegisterScreenState>(

          listenWhen: (previous, current) {
            return current is LoadingState || current is ErrorState ||
                current is SuccessState;
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
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      _userName = value;
                      _checkFields();
                    },
                    style: TextStyle(fontSize: 15.sp),

                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff535353),),
                      hintStyle: TextStyle(fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: lightBlackColor),

                      labelText: 'User name',
                      hintText: 'Enter your user name',

                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          borderSide: BorderSide(
                            color: Color(0xffBDBDBD),
                            width: 1.0,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          width: 2.0,
                        ),
                      ),


                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(4.r)),
                    ),
                  ),
                  SizedBox(height: 24.h,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 155.w,
                        child: TextFormField(
                          onChanged: (value) {
                            _firstName = value;
                            _checkFields();
                          },
                          style: TextStyle(fontSize: 15.sp),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff535353),),
                            hintStyle: TextStyle(fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: lightBlackColor),

                            labelText: 'First name',
                            hintText: 'Enter first name',

                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                  color: Color(0xffBDBDBD),
                                  width: 1.0,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                width: 2.0,
                              ),
                            ),

                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(4.r)),
                          ),
                        ),
                      ),
                      // SizedBox(width: 17.w),
                      Container(
                        width: 155.w,
                        child: TextFormField(
                          onChanged: (value) {
                            _lastName = value;
                            _checkFields();
                          },
                          style: TextStyle(fontSize: 15.sp),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff535353),),
                            hintStyle: TextStyle(fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: lightBlackColor),

                            labelText: 'Last name',
                            hintText: 'Enter last name',

                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                  color: Color(0xffBDBDBD),
                                  width: 1.0,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                width: 2.0,
                              ),
                            ),


                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(4.r)),
                          ),
                        ),
                      ),
                    ],),
                  SizedBox(height: 24.h,),
                  TextFormField(
                    onChanged: (value) {
                      _email = value;
                      _checkFields();
                    },
                    style: TextStyle(fontSize: 15.sp),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff535353),),
                      hintStyle: TextStyle(fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: lightBlackColor),

                      labelText: 'Email',
                      hintText: 'Enter your email',

                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          borderSide: BorderSide(
                            color: Color(0xffBDBDBD),
                            width: 1.0,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          width: 2.0,
                        ),
                      ),


                      border: OutlineInputBorder(


                          borderRadius: BorderRadius.circular(4.r)),
                    ),
                  ),
                  SizedBox(height: 24.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 155.w,
                        child: TextFormField(

                          onChanged: (value) {
                            _password = value;
                            _checkFields();
                            _updatePassword(_password);
                           
                          },
                          style: TextStyle(fontSize: 15.sp),
                          decoration: InputDecoration(
                            labelStyle: TextStyle(fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff535353),),
                            hintStyle: TextStyle(fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: lightBlackColor),

                            labelText: 'Password',
                            hintText: 'Enter password',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                  color: Color(0xffBDBDBD),
                                  width: 1.0,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                width: 2.0,
                              ),
                            ),


                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(4.r)),
                          ),
                        ),
                      ),

                      Container(
                        width: 155.w,
                        child: TextFormField(
                          onChanged: (value) {
                            _confirmPassword = value;
                            _checkFields();
                            _validatePasswords();
                          },
                          style: TextStyle(fontSize: 15.sp),

                          decoration: InputDecoration(
                            errorText: _errorText, // Show error if passwords do not match
                            errorStyle: TextStyle(color: Colors.red),
                            labelStyle: TextStyle(fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff535353),),
                            hintStyle: TextStyle(fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: lightBlackColor),

                            labelText: 'Confirm password',
                            hintText: 'Confirm password',

                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.r),
                                borderSide: BorderSide(
                                  color: Color(0xffBDBDBD),
                                  width: 1.0,
                                )),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                width: 2.0,
                              ),
                            ),


                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(4.r)),
                          ),
                        ),
                      ),
                    ],),
                  SizedBox(height: 24.h,),
                  TextFormField(
                    onChanged: (value) {
                      _phone = value;
                      _checkFields();
                    },
                    style: TextStyle(fontSize: 15.sp),
                    decoration: InputDecoration(

                      labelStyle: TextStyle(fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff535353),),
                      hintStyle: TextStyle(fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: lightBlackColor),

                      labelText: 'Phone number',
                      hintText: 'Enter phone number',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.r),
                          borderSide: BorderSide(
                            color: Color(0xffBDBDBD),
                            width: 1.0,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme
                              .of(context)
                              .primaryColor,
                          width: 2.0,
                        ),
                      ),

                      border: OutlineInputBorder(


                          borderRadius: BorderRadius.circular(4.r)),
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  _buildValidationIcon(
                      isLengthValid, 'Between 8 and 20 Characters'),
                  _buildValidationIcon(
                      hasUpperCase, '1 uppercase letter Character'),
                  _buildValidationIcon(hasNumber, '1 or more numbers'),
                  _buildValidationIcon(
                      hasSpecialChar, '1 or more numbers special character'),
                  SizedBox(height: 16.0),
                  BlocBuilder<RegisterViewModel, RegisterScreenState>(
                    builder: (context, state) {
                      switch (state) {
                        case LoadingState():
                          {
                            return CircularProgressIndicator();
                          }
                        default:
                          {
                            return ElevatedButton(
                              onPressed:
                              _isButtonEnabled
                                  ? () {
                                register();
                              }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity.w, 48.h),
                                shape: RoundedRectangleBorder(

                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                                backgroundColor: _isButtonEnabled
                                    ? primaryColor
                                    : Colors.grey,
                              ),

                              child: Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: whitebackgroundColor),
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
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?', style: TextStyle(
                            color: blackColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400)),

                        InkWell(
                            onTap: () {},
                            child: Text(' Login', style: TextStyle(color: Theme
                                .of(context)
                                .primaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500))),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    viewModel.doIntent(RegisterIntent(
        _email,
        _firstName,
        _lastName,
        _email,
        _password,
        _confirmPassword,
        _phone));
  }

  void _updatePassword(String newPassword) {
    setState(() {
      _password = newPassword;
      isLengthValid = newPassword.length >= 8 && newPassword.length <= 20;
      hasUpperCase = RegExp(r'[A-Z]').hasMatch(newPassword);
      hasNumber = RegExp(r'[0-9]').hasMatch(newPassword);
      hasSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(newPassword);
    });
  }

  Widget _buildValidationIcon(bool isValid, String message) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.check_circle,
          color: isValid ? Color(0xff02369c) : Colors.black12, size: 18,
        ),
        SizedBox(width: 8.w, height: 22.h),
        Text(message, style: TextStyle(fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xff989898))),
      ],
    );
  }

  void _validatePasswords() {
    if (_password != _confirmPassword) {
      setState(() {
        _errorText = "Password not matched"; // Show error if they don't match
      });
    } else {
      setState(() {
        _errorText = null; // Clear error if they match
      });
    }}
}

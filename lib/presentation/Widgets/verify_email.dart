import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/res/colors.dart';

class VerifyEmail extends StatelessWidget {
  final Exception? exception;
  final TextEditingController emailController;
  final void Function(String) sendOtp;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  VerifyEmail({
    super.key,
    this.exception,
    required this.emailController,
    required this.sendOtp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Text(
              'Forget password',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
            ),
             SizedBox(
              height: 16.h,
            ),
             Text(
              'Please enter your email associated to\nyour account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            TextFormField(

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                final emailPattern =
                RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                if (!emailPattern.hasMatch(value)) {
                  return 'Invalid Email';
                }
                return null;
              },
              controller: emailController,
              decoration: InputDecoration(

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
                label: const Text('Email'),
                hintText: 'Enter your email',
                errorText: exception != null ? 'This Email is not valid' : null,
              ),
            ),
             SizedBox(
              height: 16.h,
            ),
            if (exception != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'There was an error: ${exception.toString()}',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
             SizedBox(
              height: 48.h,
            ),
            SizedBox(
              height: 48.h,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    sendOtp(emailController.text);
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity.w, 48.h),
                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  backgroundColor: exception == null
                      ? const Color(0xFF02369C)
                      : const Color(0xFF878787),
                  foregroundColor: Colors.white,
                ),
                child:  Text('Continue' ,style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500,color:whitebackgroundColor),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
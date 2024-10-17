import 'package:flutter/material.dart';
import 'package:online_exam/presentation/utils.dart';

class VerifyOtpWidget extends StatelessWidget {
  final TextEditingController emailController;
  final List<TextEditingController> otpControllers;
  final List<FocusNode> focusNodes;
  final Exception? exception;
  final Function(String email, String otp) verifyOtp;
  final Function(String email) sendOtp;

  const VerifyOtpWidget({
    super.key,
    required this.emailController,
    required this.otpControllers,
    required this.focusNodes,
    this.exception,
    required this.verifyOtp,
    required this.sendOtp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Email verification',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please enter your code that was sent to your\nemail address',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 60,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      controller: otpControllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 5) {
                          FocusScope.of(context)
                              .requestFocus(focusNodes[index + 1]);
                        }
                        if (index == 5 && value.isNotEmpty) {
                          final otp = otpControllers
                              .map((controller) => controller.text)
                              .join();
                          print(otp);
                          verifyOtp(emailController.text, otp);
                        }
                      },
                      decoration: InputDecoration(
                        filled: true, // Enable filling
                        fillColor: Color(0xFFDFE7F7),
                        errorText: exception != null ? 'Invalid code' : null,
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            if (exception != null)
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 16,
                    ),
                    Text(
                      'Invalid code',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive the code?"),
                TextButton(
                  onPressed: () {
                    sendOtp(emailController.text);
                    showCustomDialog(
                      context,
                      message: 'The OTP has been resent to your email.',
                      title: 'OTP Resent',
                    );
                  },
                  child: const Text(
                    'Resend',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Color(0xFF02369C)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
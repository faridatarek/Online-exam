import 'package:flutter/material.dart';

class VerifyPasswordWidget extends StatelessWidget {
  final double screenWidth;
  final Exception? exception;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final GlobalKey<FormState> formKey;
  final Function(String email, String newPassword) onResetPassword;
  final TextEditingController emailController;

  const VerifyPasswordWidget({
    super.key,
    required this.screenWidth,
    required this.exception,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
    required this.onResetPassword,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Reset password',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(height: 16),
            const Text(
              'Password must not be empty and must contain\n6 characters with upper case letter and one\nnumber at least',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
            const SizedBox(height: 30),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Invalid';
                }

                return null;
              },
              controller: emailController,
              decoration: const InputDecoration(
                label: Text('email'),
                hintText: 'email',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Invalid Password';
                }
                return null;
              },
              controller: passwordController,
              decoration: InputDecoration(
                label: const Text('New password'),
                hintText: 'Enter your password',
                errorText: exception != null ? 'Password is invalid ' : null,
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 48,
              width: screenWidth,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    onResetPassword(
                      emailController.text,
                      passwordController.text,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: exception == null
                      ? const Color(0xFF02369C)
                      : const Color(0xFF878787),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
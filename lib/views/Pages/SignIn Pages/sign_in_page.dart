import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../view%20model/view_model.dart';
import 'sign_in_appbar.dart';
import "../../../Re-usable%20Widgets/elevated_button.dart";
import '../../../Re-usable%20Widgets/text_form_field.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ViewModel>(context);
    const appbarTitle = "Don't have an account?";
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: appBar(context, appbarTitle),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: viewModel.loginFormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Login to your account",
                    style: TextStyle(
                      color: const Color(0xFF101928),
                      fontSize: 32,
                      fontFamily: GoogleFonts.lora().fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Start exploring the universe",
                    style: TextStyle(
                      color: Color(0xFF344054),
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // TextFormField
              CustomTextFormField(
                hintText: "Your@gmail.com",
                labelText: "Email",
                controller: viewModel.loginEmailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onChanged: (value) => viewModel.validateLoginForm(),
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
              ),
              const SizedBox(height: 25),
              CustomTextFormField(
                hintText: "Enter password",
                labelText: 'Password',
                controller: viewModel.loginPasswordController,
                obscureText: viewModel.obscureLoginPassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                 
                  return null;
                },
                onChanged: (value) => viewModel.validateLoginForm(),
                suffixIcon: IconButton(
                  icon: Icon(
                    viewModel.obscureLoginPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 14,
                    color: const Color(0xFF98A2B3),
                  ),
                  onPressed: viewModel.toggleLoginPasswordVisibility,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Forgot password logic
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Color(0xFFFF59A2),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                buttonText: "Login",
                onPressed: viewModel.isLoginFormValid
                    ? () => viewModel.validateAndLogin(context)
                    : () {},
                sideColor: viewModel.isLoginFormValid
                    ? const Color(0xFF60983C)
                    : const Color(0xFFD0D5DD),
                backgroundColor: viewModel.isLoginFormValid
                    ? const Color(0xFF60983C)
                    : const Color(0xFFD0D5DD),
                textColor: const Color(0xFFFFFFFF),
              ),
              const SizedBox(height: 12),
              CustomElevatedButton(
                buttonText: "Sign in with Google",
                onPressed: () {},
                sideColor: const Color(0xFFD0D5DD),
                backgroundColor: const Color(0xFFFFFFFF),
                textColor: const Color(0xFF344054),
                icon: Image.asset(
                  "lib/assets/google-logo-icon-removebg.png",
                  height: 24,
                  width: 24,
                ),
              ),
            ],
          ),  
        ),
      ),
    );
  }
}

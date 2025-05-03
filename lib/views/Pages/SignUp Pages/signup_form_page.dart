import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_form_page/view%20model/view_model.dart';
import 'package:login_form_page/views/Pages/SignIn%20Pages/sign_in_page.dart';
import 'package:provider/provider.dart';
import 'signup_appbar.dart';
import 'terms_and_conditions.dart';
import '../../../Re-usable%20Widgets/elevated_Button.dart';
import '../../../Re-usable Widgets/text_form_field.dart';

class SignUpFormPage extends StatelessWidget {
  const SignUpFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ViewModel>(context);
    const appbarTitle = "Have an account?";
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: signUpAppBar(context, appbarTitle),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: viewModel.signUpformKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Text(
                      "Create an account",
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
                  height: 12,
                ),
                CustomTextFormField(
                    hintText: "Enter your name",
                    labelText: "Name",
                    controller: viewModel.nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      viewModel.updateName(value);
                      viewModel.validateSignUpForm();
                    }),
                const SizedBox(height: 25),
                CustomTextFormField(
                  hintText: "Enter your email",
                  labelText: "Email",
                  controller: viewModel.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    if (!value.contains('@')) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    viewModel.updateEmail(value);
                    viewModel.validateSignUpForm();
                  },
                  keyboardType: TextInputType.emailAddress,
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                ),
                const SizedBox(height: 25),
                CustomTextFormField(
                  hintText: "Enter your phone number",
                  labelText: "Phone number",
                  controller: viewModel.phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    if (value.length < 11) {
                      return 'Must be 11 digits';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    viewModel.updatePhoneNumber(value);
                    viewModel.validateSignUpForm();
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  hintText: "Create a password",
                  labelText: 'Password',
                  obscureText: viewModel.obscurePassword,
                  validator: (value) {
                    
                    if (value!.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    viewModel.updatePassword(value);
                    viewModel.validateSignUpForm();
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      viewModel.obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                                   size: 14,
                    color: const Color(0xFF98A2B3),
                    ),
                    onPressed: viewModel.togglePasswordVisibility,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  hintText: "Confirm password",
                  labelText: 'Confirm password',
                  obscureText: viewModel.obscureConfirmPassword,
                  validator: (value) {
                    if (value != viewModel.password) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    viewModel.updateConfirmPassword(value);
                    viewModel.validateSignUpForm();
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      viewModel.obscureConfirmPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                                              size: 14,
                    color: const Color(0xFF98A2B3),
                    ),
                    onPressed: viewModel.toggleConfirmPasswordVisibility,
                  ),
                ),
                const SizedBox(height: 40),
                buildTermsAndConditions(),
                const SizedBox(height: 12),
                CustomElevatedButton(
                  buttonText: "Sign up",
                  onPressed: viewModel.isFormValid
                      ? () {
                          if (viewModel.validateFormAndSubmit(context)) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignInPage(),
                              ),
                            );
                          }
                        }
                      : () {}, // Providing an empty function when form is invalid
                  sideColor: viewModel.isFormValid
                      ? const Color(0xFF60983C)
                      : const Color(0xFFD0D5DD),
                  backgroundColor: viewModel.isFormValid
                      ? const Color(0xFF60983C)
                      : const Color(0xFFD0D5DD),
                  textColor: const Color(0xFFFFFFFF),
                ),
                
                const SizedBox(height: 12),
                CustomElevatedButton(
                  buttonText: "Sign up with Google",
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
      ),
    );
  }
}

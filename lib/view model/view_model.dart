import 'package:flutter/material.dart';
import 'package:login_form_page/models/user_model.dart';

class ViewModel extends ChangeNotifier {
  final _signUpformKey = GlobalKey<FormState>();
  final _loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> get signUpformKey => _signUpformKey;
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

  //flutter build apk --split-per-abi

  final user = UserModel();
  var _isFormValid = false;
  bool get isFormValid => _isFormValid;

// Login form variables
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  bool _isLoginFormValid = true;
  bool _obscureLoginPassword = true;

  bool get isLoginFormValid => _isLoginFormValid;
  bool get obscureLoginPassword => _obscureLoginPassword;

  void toggleLoginPasswordVisibility() {
    _obscureLoginPassword = !_obscureLoginPassword;
    notifyListeners();
  }
// Updating validation methods to check for validity

  bool _termsAccepted = false;

  bool get termsAccepted => _termsAccepted;
  void toggleTermsAccepted(bool? value) {
    _termsAccepted = value ?? false;
    validateSignUpForm();
    notifyListeners();
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool get obscurePassword => _obscurePassword;
  bool get obscureConfirmPassword => _obscureConfirmPassword;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }

  String _password = '';
  String _confirmPassword = '';

  // Update the password getters
  String get password => _password;
  String get confirmPassword => _confirmPassword;

  void updatePassword(String value) {
    _password = value;
    validateSignUpForm();
    notifyListeners();
  }

  void updateConfirmPassword(String value) {
    _confirmPassword = value;
    validateSignUpForm();
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _obscureConfirmPassword = !_obscureConfirmPassword;
    notifyListeners();
  }

  void updateName(String value) {
    user.name = value;
    validateSignUpForm();
    notifyListeners();
  }

  void updateEmail(String value) {
    user.email = value;
    validateSignUpForm();
    notifyListeners();
  }

  void updatePhoneNumber(String value) {
    user.phoneNumber = value;
    validateSignUpForm();
    notifyListeners();
  }

  void validateLoginForm() {
    _isLoginFormValid = loginFormKey.currentState?.validate() ?? false;
    notifyListeners();
  }

  bool validateAndLogin(BuildContext context) {
    if (!loginFormKey.currentState!.validate()) {
      return false;
    }

    // Debug print to check values
    print('Login Email: ${loginEmailController.text}');
    print('Stored Email: ${user.email}');
    print('Login Password: ${loginPasswordController.text}');
    print('Stored Password: $_password');

    if (loginEmailController.text.trim() == user.email.trim() &&
        loginPasswordController.text == _password) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Login successful!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Color(0xFF60983C),
          duration: Duration(seconds: 2),
        ),
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Invalid email or password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Color(0xFFFF59A2),
        ),
      );
      return false;
    }
  }
  // void validateLoginForm() {
  //   _isLoginFormValid = loginEmailController.text.isNotEmpty &&
  //       loginPasswordController.text.isNotEmpty;
  //   notifyListeners();
  // }

  // bool validateAndLogin(BuildContext context) {
  //   if (loginEmailController.text == user.email &&
  //       loginPasswordController.text == _password) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //           'Login successful for ${user.name}!',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 16,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //         backgroundColor: Color(0xFF60983C),
  //       ),
  //     );
  //     return true;
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(
  //           'Invalid email or password',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 16,
  //             fontWeight: FontWeight.w600,
  //           ),
  //         ),
  //         backgroundColor: const Color(0xFFFF59A2),
  //       ),
  //     );
  //   }
  //   return false;
  // }

  void validateSignUpForm() {
    bool isValid = _signUpformKey.currentState?.validate() ?? false;
    isValid = isValid &&
        _termsAccepted &&
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        _password.isNotEmpty &&
        _confirmPassword.isNotEmpty &&
        _password == _confirmPassword;

    _isFormValid = isValid;
    notifyListeners();
  }

  bool validateFormAndSubmit(BuildContext context) {
    if (!_termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please accept the terms and conditions',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Color(0xFFFF59A2),
        ),
      );
      return false;
    }

    if (_signUpformKey.currentState?.validate() ?? false) {
      if (_isFormValid) {
        // Form is valid, proceed with submission
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Account created successfully for ${user.name}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: const Color(0xFF60983C),
          ),
        );
        return true;
      }
    }
    return false;
  }
}

// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:login_form_page/view%20model/view_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late var viewModel = ViewModel();

  setUp(() {
    viewModel = ViewModel();
  });
  group("viewModel Tests", () {
    test("initial values should pass", () {
      expect(viewModel.password, isEmpty);
      expect(viewModel.confirmPassword, isEmpty);
      expect(viewModel.isFormValid, false);
      expect(viewModel.obscurePassword, true);
    });
    test("Password Visibilty toggle works", () {
      // password should be obscured initially
      expect(viewModel.obscurePassword, true);
      // Togle visibility
      viewModel.togglePasswordVisibility();
      expect(viewModel.obscurePassword, false);
      // toggle back
      viewModel.togglePasswordVisibility();
      expect(viewModel.obscurePassword, true);
    });

    test("Passwords must match", () {
      // testing with passwords that does not match
      viewModel.updatePassword("Password123");
      viewModel.updateConfirmPassword("Password234");
      expect(viewModel.isFormValid, false);

      // testing with matching passwords
      viewModel.updatePassword("Shakirullah25");
      viewModel.updateConfirmPassword("Shakirullah25");
      expect(viewModel.isFormValid, false);
    });
  });
}

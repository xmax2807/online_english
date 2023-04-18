import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerValidator = ChangeNotifierProvider((_) => RegisterValidator());

class RegisterValidator extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  String get email => emailController.text;
  String get password => passwordController.text;

  late bool _isEmailValid = false;
  late bool _isPasswordValid = false;
  late bool _isRepasswordValid = false;
  bool get isAllValid =>
      _isEmailValid && _isPasswordValid && _isRepasswordValid;

  RegisterValidator() {
    emailController.addListener(_onChanged);
    passwordController.addListener(_onChanged);
    rePasswordController.addListener(_onChanged);
  }

  String? validateEmail(String? value) {
    _isEmailValid = false;
    if (value == null) return 'This field is required';
    if (!value.isEmail) {
      return 'Please enter correct email';
    }
    _isEmailValid = true;
    return null;
  }

  String? validatePassword(String? value) {
    _isPasswordValid = false;
    if (value == null || value.isEmpty) return 'This field is required';

    _isPasswordValid = true;
    return null;
  }

  String? validateRePassword(String? value) {
    _isRepasswordValid = false;
    if (value == null || value.isEmpty) return 'This field is required';
    if (value != passwordController.text) {
      return 'RePassword must match with the password';
    }
    _isRepasswordValid = true;
    return null;
  }

  bool _isDelaying = false;
  void _onChanged() async {
    if (_isDelaying) return;

    _isDelaying = true;
    await Future.delayed(const Duration(milliseconds: 100));
    _isDelaying = false;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
  }
}

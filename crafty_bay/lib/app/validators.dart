import 'package:email_validator/email_validator.dart';

class Validators {
  static String? validateNullOrEmpty(String? value, String invalidMessage) {
    if (value == null || value.isEmpty) {
      return invalidMessage;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !EmailValidator.validate(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}

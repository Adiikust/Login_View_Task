class Validation {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Enter your email';
    } else if (!_isValidEmail(email)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'Enter your password';
    }
    if (password.length < 6) {
      return 'Password should be 6+ characters long';
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name!.isEmpty) {
      return 'Enter your name';
    }
    if (name.length < 4) {
      return 'Enter your name 4+ character long';
    }
    return null;
  }

  static String? validatePhoneNumber(String? phone) {
    if (phone!.isEmpty) {
      return 'Enter your phone number';
    }
    if (phone.length < 11) {
      return 'Enter valid phone number';
    }
    return null;
  }

  static String? validateVerificationCodeNumber(String? phone) {
    if (phone!.isEmpty) {
      return 'Please enter a PIN';
    }
    if (phone.length < 5) {
      return 'PIN must be 5 digits';
    }
    return null;
  }

  static String? validateRequired(String? name) {
    if (name!.isEmpty) {
      return 'Required';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String? confirmPassword, String? password) {
    if (confirmPassword!.isEmpty) {
      return 'Enter your confirm password';
    }
    if (confirmPassword != password) {
      return 'Password do not match';
    }
    return null;
  }
}

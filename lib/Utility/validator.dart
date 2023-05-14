class Validator {
  static String? fullNameValidate(String? value) {
    if (value != "" && value != null) {
      return null;
    } else {
      return "This field is required ";
    }
  }

  static String? passwordValidate(String? value) {
    if (value == null && value == "") {
      return 'This field is required';
    } else if (value!.length < 5) {
      return 'Password must be at least 5 characters long';
    }
    return null;
  }

  static String? emailValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }
}

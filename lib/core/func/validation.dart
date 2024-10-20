String? validateFirstName(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your first name';
  }
  return null;
}

String? validateLastName(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your last name';
  }
  return null;
}

String? validateUsername(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your username';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your phone number';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your email';
  }
  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'invalid email address';
  }
  return null;
}

String? validateDateOfBirth(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your date of birth';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'please enter your password';
  }
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~-]).{8,}$';

  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return '''
Password must be at least 8 characters,
include an uppercase letter, number and symbol.
      ''';
  }
  return null;
}

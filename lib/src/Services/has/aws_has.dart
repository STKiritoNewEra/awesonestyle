class AwsHas {
  /// Check if a string is a [url].
  static bool url(String string) {
    RegExp urlRegExp = RegExp(r"http(s)?:\/\/[^\s]+");
    return urlRegExp.hasMatch(string);
  }

  /// Check if a string is an [email].
  static bool email(String string) {
    RegExp regex =
        RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,7}\b');
    return regex.hasMatch(string);
  }

  /// Check if a string is a valid password [password].
  static bool password(String password) {
    // Check minimum length
    if (password.length < 8) {
      return false;
    }

    // Check for at least one uppercase, one lowercase, one number, and one special character
    RegExp upperCase = RegExp(r'[A-Z]');
    RegExp lowerCase = RegExp(r'[a-z]');
    RegExp digit = RegExp(r'[0-9]');
    RegExp specialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

    if (!upperCase.hasMatch(password) ||
        !lowerCase.hasMatch(password) ||
        !digit.hasMatch(password) ||
        !specialChar.hasMatch(password)) {
      return false;
    }

    return true;
  }
}

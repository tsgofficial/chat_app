class MyUtils {
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email.trim());
  }

  static bool hasUpperCase(String text) {
    final upperCaseRegex = RegExp(r'[A-Z]');
    return upperCaseRegex.hasMatch(text);
  }

  static bool hasLowerCase(String text) {
    final lowerCaseRegex = RegExp(r'[a-z]');
    return lowerCaseRegex.hasMatch(text);
  }

  static hasNumber(String text) {
    final numberRegex = RegExp(r'[0-9]');
    return numberRegex.hasMatch(text);
  }

  static hasSpecialCharacter(String text) {
    final specialCharacterRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');
    return specialCharacterRegex.hasMatch(text);
  }

  static bool isValidPassword(String password) {
    // At least 1 number
    // At least 6 characters in total
    // At least 1 lowercase letter
    // At least 1 uppercase letter
    // At least 1 special character (symbol like !@#\$%^&* etc.)
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>]).{6,}$',
    );
    return passwordRegex.hasMatch(password);
  }

  static bool isValidUsername(String username) {
    // No spaces
    // 3–20 characters
    // Only letters, numbers, underscores
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
    return usernameRegex.hasMatch(username);
  }
}

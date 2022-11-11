extension StringExt on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidPhoneNumber {
    final phoneRegExp = RegExp(r'(84|0[3|5|7|8|9])+([0-9]{8})\b');
    return phoneRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return length > 7 && passwordRegExp.hasMatch(this);
  }

}
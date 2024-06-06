bool isAlphabet(String input) {
  final alphabetsRegex = RegExp(r'^[a-zA-Z]+$');
  return alphabetsRegex.hasMatch(input);
}

bool isValidPhoneNumber(String input) {
  final phoneNumberRegex = RegExp(r'^[0-9]{10}$');
  return phoneNumberRegex.hasMatch(input);
}

bool isValidPassword(String input) {
  return input.length > 7 ? true : false;
}

bool isValidEmail(String input) {
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
  return emailRegex.hasMatch(input);
}

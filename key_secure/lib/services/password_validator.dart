passwordValidator(enteredPassword) {
  final capitalRegex = RegExp(r'(?=.*?[A-Z])');
  final numberRegex = RegExp(r'(?=.*?[0-9])');
  final specialRegex = RegExp(r'(?=.*?[#?!@$%^&*-])');
  if (enteredPassword.length < 8) {
    return "Weak";
  }
  if (enteredPassword.length >= 8 &&
      capitalRegex.hasMatch(enteredPassword) &&
      numberRegex.hasMatch(enteredPassword) &&
      specialRegex.hasMatch(enteredPassword)) {
    return "Strong";
  }
  return "Normal";
}

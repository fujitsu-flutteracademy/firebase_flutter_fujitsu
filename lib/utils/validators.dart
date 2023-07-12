class FormValidator {
  String? isValidName(String? text) {
    if (text == null || text.isEmpty || text.length < 3) {
      return "No es un nombre valido";
    }
    return null;
  }
}

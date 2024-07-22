class Validators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'El campo no puede estar vacio';
    }
    final nameRegExp = RegExp(r'^[A-Z][a-zA-Z]+$');
    if (!nameRegExp.hasMatch(value)) {
      return 'Introduce un nombre Valido';
    }
    return null;
  }
}
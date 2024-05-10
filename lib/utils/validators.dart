class Validators {
  static String? validateNull(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    return null;
  }

  static String? validateUrl(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле обязательно для заполнения';
    }
    RegExp exp = RegExp(
        r'(?:(?:https?|ftp|mailto|smb):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    if (!exp.hasMatch(value)) {
      return 'Неправильный формат поля';
    }
    return null;
  }
}

String removeTagsFromUrl(String url) {
  final tagRegExp =
      RegExp(r'<\/?[^>]+>|<|>'); // Регулярное выражение для поиска тегов
  return url.replaceAll(tagRegExp, ''); // Удаляет теги из строки
}

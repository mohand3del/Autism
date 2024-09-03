
bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String userToken = 'userToken';
}

class Helper {
  static String limitWords(String? text, int wordLimit) {
    // تحقق من أن النص ليس null وأنه يحتوي على كلمات.
    if (text == null || text.isEmpty) {
      return "";
    }

    final words = text.split(' ');

    // تحقق مما إذا كان عدد الكلمات أقل من أو يساوي الحد.
    if (words.length <= wordLimit) {
      return text;
    }

    return words.take(wordLimit).join(' ') + '...';
  }
}
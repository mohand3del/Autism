
bool isLoggedInUser = false;

class SharedPrefKeys {
  static const String userToken = 'userToken';
}

class Helper {
  static String limitWords(String? text, int wordLimit, {int wordsPerLine = 5}) {
    if (text == null || text.isEmpty) {
      return "";
    }

    final words = text.split(' ');

    if (words.length <= wordLimit) {
      return text;
    }

    final limitedWords = words.take(wordLimit).toList();


    for (int i = wordsPerLine; i < limitedWords.length; i += wordsPerLine) {
      limitedWords.insert(i, '\n');
    }

    return limitedWords.join(' ');
  }


  static String formatNumber(String? numberString) {

    int number = int.tryParse(numberString ?? '') ?? 0;

    if (number >= 1000000) {
      return (number / 1000000).toStringAsFixed(1) + 'M'; // M للمليون
    } else if (number >= 1000) {
      return (number / 1000).toStringAsFixed(1) + 'K'; // K للألف
    } else {
      return number.toString();
    }
  }

  static String limitWordsV2(String? text, int wordLimit, {int wordsPerLine = 5}) {
    if (text == null || text.isEmpty) {
      return "";
    }


    final words = text.split(' ');


    if (words.length <= wordLimit) {
      return text;
    }


    final limitedWords = words.take(wordLimit).toList();


    for (int i = wordsPerLine; i < limitedWords.length; i += wordsPerLine) {
      limitedWords.insert(i, '\n');
    }


    return limitedWords.join(' ') + '...';
  }

}
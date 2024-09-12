
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

    return limitedWords.join(' ') + '...';
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

  static String limitChars(String? text, int charLimit, {int charsPerLine = 10}) {
    if (text == null || text.isEmpty) {
      return "";
    }

    // Check if the text exceeds the char limit
    bool isTruncated = text.length > charLimit;

    // Truncate the text to the character limit
    String limitedText = isTruncated ? text.substring(0, charLimit) : text;

    // Insert line breaks after every 'charsPerLine' characters
    StringBuffer formattedText = StringBuffer();
    for (int i = 0; i < limitedText.length; i++) {
      formattedText.write(limitedText[i]);
      // Add a line break after reaching the limit of characters per line
      if ((i + 1) % charsPerLine == 0) {
        formattedText.write('\n');
      }
    }

    // Add ellipsis if the text was truncated
    if (isTruncated) {
      formattedText.write('...');
    }

    return formattedText.toString();
  }


}
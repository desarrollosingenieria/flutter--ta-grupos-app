String isAConsonantOrVowel({required String key}) {
  String result = 'other';
  if (key == 'A' || key == 'E' || key == 'I' || key == 'O' || key == 'U') {
    result = 'vowel';
  } else if (key == '.' || key == ',' || key == '?') {
    result = 'other';
  } else {
    result = 'consonant';
  }
  return result;
}
